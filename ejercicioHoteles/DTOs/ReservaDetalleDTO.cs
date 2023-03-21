using ejercicioHoteles.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ejercicioHoteles.DTOs
{
    public class ReservaDetalleDTO
    {
        public int id { get; set; }
        public DateTime FechaReserva { get; set; }
        public DateTime FechaEntrada { get; set; }
        public DateTime FechaSalida { get; set; }
        public double CostoReserva { get; set; }
        public double ValorImpuestos { get; set; }
        public Habitacion Habitacion { get; set; }
        public Hotel Hotel { get; set; }
        public Cliente Cliente { get; set; }

    }
}
