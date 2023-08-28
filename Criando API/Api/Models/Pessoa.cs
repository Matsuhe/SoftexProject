using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class Pessoa
    {
        [Key]
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cidade { get; set; }
        public int Idade { get; set; }

        public Pessoa()
        {
            Id = 0;
            Nome = "";
            Cidade = "";
            Idade = 0; 
        }
    }
}
