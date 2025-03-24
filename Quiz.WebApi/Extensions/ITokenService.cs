using Quiz.Entity.Models;

namespace Quiz.WebApi.Extensions
{
    public interface ITokenService
    {
        string GetToken(User user);
        string GetSignature();
        bool ValidateSignature(string signature);
    }
}