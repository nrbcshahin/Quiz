using System.Text.Json.Serialization;

namespace Quiz.Entity.Models
{
    public class BaseModel
    {
        [JsonIgnore]
        public int CreatedBy { get; set; }

        [JsonIgnore]
        public DateTime CreatedDate { get; set; }

        [JsonIgnore]
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public DateTime? UpdatedDate { get; set; }
    }
}