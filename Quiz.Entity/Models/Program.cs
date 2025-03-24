using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Entity.Models
{
    public class Program
    {
        [Key]
        public int ProgramId { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public int SerialNo { get; set; }
    }
}
