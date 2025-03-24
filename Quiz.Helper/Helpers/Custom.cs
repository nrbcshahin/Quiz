using System.Dynamic;
using System.Net;
using System.Net.Sockets;

namespace Quiz.Helper.Helpers
{
    public static class Custom
    {

        public static dynamic MergeObject(object item1, object item2)
        {
            if (item1 == null || item2 == null)
            {
                return item1 ?? item2 ?? new ExpandoObject();
            }

            dynamic expando = new ExpandoObject();
            var result = expando as IDictionary<string, object>;

            foreach (var fi in item1.GetType().GetProperties())
            {
                result[fi.Name] = fi.GetValue(item1, null);
            }

            foreach (var fi in item2.GetType().GetProperties())
            {
                result[fi.Name] = fi.GetValue(item2, null);
            }

            return result;
        }


        public static string RandomString(int length)
        {
            Random random = new();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public static string GetLocalIp()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("No network adapters with an IPv4 address in the system!");
        }
    }
}