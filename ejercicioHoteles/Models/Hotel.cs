using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ejercicioHoteles.Models
{
    public class Hotel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Region { get; set; }
        public string Pais { get; set; }
        public int HabitacionesTotales { get; set; }
        public int HabitacionesDisponibles { get; set; }
        public string Habilitado { get; set; }
    }
}
