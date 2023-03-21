using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ejercicioHoteles.Models;

namespace ejercicioHoteles.Data
{
    public class ejercicioHotelesContext : DbContext
    {
        public ejercicioHotelesContext (DbContextOptions<ejercicioHotelesContext> options)
            : base(options)
        {
        }

        public DbSet<ejercicioHoteles.Models.Hotel> Hoteles { get; set; }

        public DbSet<ejercicioHoteles.Models.Habitacion> Habitaciones { get; set; }

        public DbSet<ejercicioHoteles.Models.Reserva> Reservas { get; set; }

        public DbSet<ejercicioHoteles.Models.Cliente> Clientes { get; set; }
    }
}
