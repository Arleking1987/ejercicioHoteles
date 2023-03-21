using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ejercicioHoteles.Models
{
    public class Habitacion
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Tipo { get; set; }
        public int Id_hotel { get; set; }
        public double Costo { get; set; }
        public double Impuesto { get; set; }
        public string Habilitado { get; set; }
    }
}
