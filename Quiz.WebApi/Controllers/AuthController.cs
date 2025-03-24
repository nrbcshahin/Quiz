
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Quiz.Contract.App.Interfaces;
using Quiz.Entity.Models;
using Quiz.Helper.VModels;
using Quiz.WebApi.Extensions;

namespace Quiz.WebApi.Controllers
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/auth")]
    public class AuthController : MyController
    {
        private readonly IAggregateService _aggregate;
        private readonly IAppConfigRepository _appConfig;

        public AuthController(IAggregateService aggregate,
            IAppConfigRepository appConfig) : base(aggregate)
        {
            _aggregate = aggregate;
            _appConfig = appConfig;
        }

        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest login)
        {
            if (login.Mobile == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Please provide valid username"
                });
            }

            if (login.Password == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Please provide valid Password"
                });
            }

            var config = await _appConfig.GetAll();
            if (!config.Any())
            {
                return Ok(new
                {
                    Success = false,
                    Message = "App configuration missing in system."
                });
            }

            var userInfo = await _aggregate.UserRepository.GetByMobile(login.Mobile);
            if (userInfo == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Please provide valid user credential."
                });
            }

            if (!userInfo.IsActive)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "User currently inactive."
                });
            }

            var existLogin = await _aggregate.LoginRepository.GetByUserId(userInfo.UserId);
            if (existLogin == null)
            {
                var status = await _aggregate.LoginRepository.Save(new Login
                {
                    UserId = userInfo.UserId,
                    IsLogin = false,
                    LoginDate = DateTime.Now,
                    DeviceInfo = Request.Headers.UserAgent.ToString(),
                    MachineName = Environment.MachineName,
                    MachineInfo = GetMachineInfo(),
                    LoginIp = Request.Host.Value,
                    Attempt = 0,
                    Signature = null
                });

                if (status <= 0)
                {
                    return Ok(new
                    {
                        Success = false,
                        Message = "User login information creation failed."
                    });
                }
            }

            var loginInfo = await _aggregate.LoginRepository.GetByUserId(userInfo.UserId);
            var verified = BCrypt.Net.BCrypt.Verify(login.Password, userInfo.Password);
            if (!verified)
            {
                var attempt = await AttemptCount(loginInfo);
                if (!attempt.Success)
                {
                    return Ok(new
                    {
                        Success = false,
                        attempt.Message
                    });
                }

                return Ok(new
                {
                    Success = false,
                    Message = "Please provide valid credential."
                });
            }

            if (loginInfo.IsLogin)
            {
                if (loginInfo.MachineName != Environment.MachineName)
                {
                    return Ok(new
                    {
                        Success = false,
                        Message = "You have already logged in with " + loginInfo.LoginIp + ", " + loginInfo.MachineName
                    });
                }

                var status = await _aggregate.LoginRepository.Logout(loginInfo.LoginId);
                if (status <= 0)
                {
                    return Ok(new
                    {
                        Success = false,
                        Message = "Logout process failed in system"
                    });
                }
            }

            var log = await LogWrite(userInfo);
            if (!log.Success)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Failed to write log in system."
                });
            }

            var signature = _aggregate.TokenService.GetSignature();
            var editStatus = await _aggregate.LoginRepository.Update(new Login
            {
                LoginId = loginInfo.LoginId,
                IsLogin = true,
                DeviceInfo = Request.Headers.UserAgent.ToString(),
                MachineName = Environment.MachineName,
                MachineInfo = GetMachineInfo(),
                LoginIp = Request.Host.Value,
                Attempt = 0,
                Signature = signature
            });

            if (editStatus <= 0)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Login point creation failed."
                });
            }

            var jwtExpiry = _aggregate.Configuration.GetSection("Jwt").GetSection("Expire").Value;
            _ = double.TryParse(jwtExpiry, out double expiry);

            return Ok(new
            {
                Success = true,
                Auth = new
                {
                    Token = _aggregate.TokenService.GetToken(userInfo),
                    Signature = signature,
                    Expiry = DateTime.Now.AddSeconds(expiry).ToString("yyyy-MM-dd HH:mm:ss"),
                    Duration = expiry
                },
                User = new
                {
                    userInfo.UserId,
                    userInfo.Name,
                    userInfo.Mobile,
                    userInfo.Role
                },
                Config = config
            });
        }

        [HttpPost]
        [Route("signature")]
        public async Task<IActionResult> Signature(AppSignature request)
        {

            if (request.Signature == null)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Signature not found in request"
                });
            }

            var validate = _aggregate.TokenService.ValidateSignature(request.Signature);
            if (!validate)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Invalid signature found."
                });
            }

            var userInfo = await _aggregate.UserRepository.GetById(request.UserId);
            if (userInfo == null)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "User information not found"
                });
            }

            var loginInfo = await _aggregate.LoginRepository.GetBySignature(request.Signature);
            if (loginInfo == null)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Login information not found"
                });
            }

            if (loginInfo.UserId != request.UserId)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Invalid user request"
                });
            }

            if (loginInfo.DeviceInfo != Request.Headers["User-Agent"].ToString())
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Invalid client request"
                });
            }

            if (loginInfo.LoginIp != Request.Host.Value)
            {
                return Unauthorized(new
                {
                    Success = false,
                    Message = "Invalid host request"
                });
            }

            var signature = _aggregate.TokenService.GetSignature();
            var status = await _aggregate.LoginRepository.Update(new Login
            {
                LoginId = loginInfo.LoginId,
                IsLogin = true,
                DeviceInfo = Request.Headers["User-Agent"].ToString(),
                MachineName = Environment.MachineName,
                MachineInfo = GetMachineInfo(),
                LoginIp = Request.Host.Value,
                Attempt = 0,
                Signature = signature
            });

            if (status <= 0)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Signature generate failed in system."
                });
            }

            var log = await LogWrite(userInfo);
            if (!log.Success)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Failed to write log in system."
                });
            }

            var jwtExpiry = _aggregate.Configuration.GetSection("Jwt").GetSection("Expire").Value;
            _ = double.TryParse(jwtExpiry, out double expiry);

            return Ok(new
            {
                Success = true,
                Auth = new
                {
                    Token = _aggregate.TokenService.GetToken(userInfo),
                    Signature = signature,
                    Expiry = DateTime.Now.AddSeconds(expiry).ToString("yyyy-MM-dd HH:mm:ss"),
                    Duration = expiry
                },
            });
        }

        [HttpPost]
        [Route("logout")]
        public async Task<IActionResult> Logout(AppSignature request)
        {
            if (request.Signature == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Please provide valid signature."
                });
            }

            var validate = _aggregate.TokenService.ValidateSignature(request.Signature);
            if (!validate)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Your signature is not valid."
                });
            }

            var userInfo = await _aggregate.UserRepository.GetById(request.UserId);
            if (userInfo == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "User information not found in our system."
                });
            }

            var loginInfo = await _aggregate.LoginRepository.GetBySignature(request.Signature);
            if (loginInfo == null)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Signature information not found in our system."
                });
            }

            if (loginInfo.UserId != request.UserId)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "User information not found in our system."
                });
            }

            var status = await _aggregate.LoginRepository.Logout(loginInfo.LoginId);
            if (status <= 0)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Logout process failed in system"
                });
            }

            var log = await LogWrite(userInfo);
            if (!log.Success)
            {
                return Ok(new
                {
                    Success = false,
                    Message = "Failed to write log in system."
                });
            }

            return Ok(new
            {
                Success = true,
                Message = "You have successfully logout."
            });
        }
    }
}