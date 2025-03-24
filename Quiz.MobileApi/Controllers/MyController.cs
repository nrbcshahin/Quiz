using System;
using System.IO;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Quiz.Entity.Models;
using Quiz.Helper.VModels;
using Quiz.MobileApi.Extensions;

namespace Quiz.MobileApi.Controllers
{
    public abstract class MyController : ControllerBase
    {
        private readonly IAggregateService _aggregate;

        protected MyController(IAggregateService aggregate)
        {
            _aggregate = aggregate;
        }

        private protected async Task<LoginResponse> Validate()
        {
            var sid = HttpContext.User.FindFirst(ClaimTypes.Sid);
            if (sid == null)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "Login information not found."
                };
            }

            var userId = int.Parse(sid.Value);
            if (userId <= 0)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "Login user information not found."
                };
            }

            var userInfo = await _aggregate.UserRepository.GetById(userId);
            if (userInfo == null)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "User account doesn't exist in system."
                };
            }

            var logInfo = await LogWrite(userInfo);
            if (!logInfo.Success)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = logInfo.Message
                };
            }

            var loginInfo = await _aggregate.LoginRepository.GetByUserId(userInfo.UserId);
            if (loginInfo == null)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "There are no login information found."
                };
            }

            if (!loginInfo.IsLogin)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "User currently logout, please login again."
                };
            }

            if (loginInfo.MachineName != Environment.MachineName)
            {
                var logout = await ForceLogout(loginInfo, userInfo);
                if (!logout.Success)
                {

                    return new LoginResponse
                    {
                        Success = false,
                        Message = logout.Message
                    };
                }

                return new LoginResponse
                {
                    Success = false,
                    Message = "Request from invalid devices."
                };
            }

            if (loginInfo.DeviceInfo != Request.Headers.UserAgent.ToString())
            {
                var logout = await ForceLogout(loginInfo, userInfo);
                if (!logout.Success)
                {

                    return new LoginResponse
                    {
                        Success = false,
                        Message = logout.Message
                    };
                }

                return new LoginResponse
                {
                    Success = false,
                    Message = "Request from invalid client."
                };
            }

            if (loginInfo.LoginIp != Request.Host.Value)
            {
                var logout = await ForceLogout(loginInfo, userInfo);
                if (!logout.Success)
                {

                    return new LoginResponse
                    {
                        Success = false,
                        Message = logout.Message
                    };
                }

                return new LoginResponse
                {
                    Success = false,
                    Message = "Request from invalid host."
                };
            }

            if (loginInfo.Signature == null)
            {
                var logout = await ForceLogout(loginInfo, userInfo);
                if (!logout.Success)
                {

                    return new LoginResponse
                    {
                        Success = false,
                        Message = logout.Message
                    };
                }

                return new LoginResponse
                {
                    Success = false,
                    Message = "Login signature not found in our system."
                };
            }

            if (loginInfo.Attempt >= 5)
            {
                var logout = await ForceLogout(loginInfo, userInfo);
                if (!logout.Success)
                {

                    return new LoginResponse
                    {
                        Success = false,
                        Message = logout.Message
                    };
                }

                return new LoginResponse
                {
                    Success = false,
                    Message = "User currently lock due to wrong attempt limit cross."
                };
            }

            return new LoginResponse
            {
                Success = true,
                User = userInfo
            };
        }

        private protected async Task<Response> LogWrite(User user)
        {
            var routeData = ControllerContext.ActionDescriptor;
            if (routeData == null)
            {
                return new Response
                {
                    Success = false,
                    Message = "Route information not found."
                };
            }

            if (routeData.AttributeRouteInfo == null)
            {
                return new Response
                {
                    Success = false,
                    Message = "Route attribute information not found."
                };
            }

            if (routeData.AttributeRouteInfo.Template == null)
            {
                return new Response
                {
                    Success = false,
                    Message = "Route attribute template information not found."
                };
            }

            var controller = routeData.ControllerName;
            var action = routeData.ActionName;
            var request = HttpContext.Request;
            var stream = new StreamReader(request.Body);
            var body = await stream.ReadToEndAsync();
            var routeName = request.Path.ToString()[4..];

            if (string.IsNullOrEmpty(routeName))
            {
                return new Response
                {
                    Success = false,
                    Message = "There are no url path found"
                };
            }

            if (!bool.Parse(_aggregate.Configuration.GetSection("Log").GetSection("Api").Value))
            {
                return new Response
                {
                    Success = true,
                    Message = routeName
                };
            }

            var header = new
            {
                Token = Request.Headers["Authorization"],
                UserAgent = Request.Headers.UserAgent,
                Host = Request.Headers["Origin"],
                Request.Method,
                Request.Path,
            };

            var status = await _aggregate.ApiLogRepository.Save(new ApiLog
            {
                Controller = controller,
                Action = action,
                RequestUrl = request.Path,
                ClientIp = Request.Headers["Origin"],
                DeviceInfo = Request.Headers.UserAgent,
                MachineInfo = GetMachineInfo(),
                UserId = user.UserId,
                HeaderData = JsonConvert.SerializeObject(header),
                RequestData = body,
                RequestDate = DateTime.Now
            });

            if (status <= 0)
            {
                return new Response
                {
                    Success = false,
                    Message = "Log write failed in system"
                };
            }

            return new Response
            {
                Success = true,
                Message = routeName
            };
        }

        private protected async Task<Response> ForceLogout(Login loginInfo, User userInfo)
        {

            var status = await _aggregate.LoginRepository.Logout(loginInfo.LoginId);
            if (status <= 0)
            {
                return new Response
                {
                    Success = false,
                    Message = "Force logout process failed."
                };
            }

            var log = await LogWrite(userInfo);
            if (!log.Success)
            {
                return new Response
                {
                    Success = false,
                    Message = "Failed to write log in system."
                };
            }

            return new Response
            {
                Success = true
            };
        }

        private protected async Task<Response> AttemptCount(Login loginInfo)
        {
            if (loginInfo.Attempt >= 5)
            {
                return new Response
                {
                    Success = false,
                    Message = "You have exceeded the number of attempts limit"
                };
            }

            var status = await _aggregate.LoginRepository.Update(new Login
            {
                LoginId = loginInfo.LoginId,
                IsLogin = false,
                DeviceInfo = Request.Headers.UserAgent.ToString(),
                MachineName = Environment.MachineName,
                MachineInfo = GetMachineInfo(),
                LoginIp = Request.Host.Value,
                Attempt = loginInfo.Attempt + 1,
                Signature = null
            });

            if (status <= 0)
            {
                return new Response
                {
                    Success = false,
                    Message = "User login information update failed."
                };
            }

            return new Response
            {
                Success = true
            };
        }

        private protected static string GetMachineInfo()
        {
            var info = new
            {
                Environment.MachineName,
                Environment.UserDomainName,
                Environment.UserName,
                Environment.ProcessorCount,
                Environment.Is64BitProcess,
                Environment.Is64BitOperatingSystem,
                Environment.OSVersion
            };
            return JsonConvert.SerializeObject(info);
        }
    }
}