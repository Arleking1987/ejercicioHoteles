using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ejercicioHoteles.Models
{
    public class Reserva
    {
        public int id { get; set; }
        public DateTime FechaReserva { get; set; }
        public DateTime FechaEntrada { get; set; }
        public DateTime FechaSalida { get; set; }
        public double CostoReserva { get; set; }
        public double ValorImpuestos { get; set; }
        public int Id_habitacion { get; set; }
        public int Id_cliente { get; set; }
    }
}
