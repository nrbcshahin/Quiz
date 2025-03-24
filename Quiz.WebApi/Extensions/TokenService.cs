using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Quiz.Entity.Models;

namespace Quiz.WebApi.Extensions
{
    public class TokenService : ITokenService
    {
        private readonly IConfiguration _configuration;

        public TokenService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GetToken(User user)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Sid, user.UserId.ToString()),
                new Claim(ClaimTypes.Name, user.Name),
                new Claim(ClaimTypes.MobilePhone, user.Mobile)
            };
            return TokenGenerator(claims);
        }

        public string GetSignature()
        {
            return TokenGenerator(null, 2);
        }

        public bool ValidateSignature(string signature)
        {
            var parameters = new TokenValidationParameters
            {
                RequireExpirationTime = true,
                RequireSignedTokens = true,
                ValidateLifetime = false,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"])),
                ValidIssuer = _configuration["Jwt:Issuer"],
                ValidAudience = _configuration["Jwt:Audience"],
                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,

                ValidateAudience = true,
                ClockSkew = TimeSpan.Zero
            };
            try
            {
                var handler = new JwtSecurityTokenHandler();
                var principal = handler.ValidateToken(signature, parameters, out _);
                Thread.CurrentPrincipal = principal;
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private string TokenGenerator(IEnumerable<Claim> claims = null, double extTime = 1)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                _configuration["Jwt:Issuer"],
                _configuration["Jwt:Audience"],
                claims,
                DateTime.Now,
                DateTime.Now.AddSeconds(Convert.ToDouble(_configuration["Jwt:Expire"]) * extTime),
                credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}