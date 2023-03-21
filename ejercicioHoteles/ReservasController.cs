using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ejercicioHoteles.Data;
using ejercicioHoteles.Models;
using ejercicioHoteles.DTOs;

namespace ejercicioHoteles
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservasController : ControllerBase
    {
        private readonly ejercicioHotelesContext _context;

        public ReservasController(ejercicioHotelesContext context)
        {
            _context = context;
        }

        // GET: api/Reservas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reserva>>> GetReserva()
        {
            return await _context.Reservas.ToListAsync();
        }

        // GET: api/Reservas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Reserva>> GetReserva(int id)
        {
            var reserva = await _context.Reservas.FindAsync(id);

            if (reserva == null)
            {
                return NotFound();
            }

            return reserva;
        }

        // GET: api/Reservas/5
        [HttpGet("{id}")]
        [Route("ObtenerReservaDetalle")]
        public async Task<ActionResult<ReservaDetalleDTO>> ObtenerReservaDetalle(int idReserva)
        {
            var reserva = await _context.Reservas.FindAsync(idReserva);

            if (reserva == null)
            {
                return NotFound();
            }
            Habitacion habitacion = await _context.Habitaciones.FindAsync(reserva.Id_habitacion);
            Hotel hotel = await _context.Hoteles.FindAsync(habitacion.Id_hotel);
            Cliente cliente = await _context.Clientes.FindAsync(reserva.Id_cliente);
            ReservaDetalleDTO reservaDetalle = new ReservaDetalleDTO{
                id = reserva.id,
                FechaReserva= reserva.FechaReserva,
                FechaEntrada= reserva.FechaEntrada,
                FechaSalida= reserva.FechaSalida,
                CostoReserva= reserva.CostoReserva,
                ValorImpuestos= reserva.ValorImpuestos,
                Habitacion = habitacion,
                Hotel = hotel,
                Cliente = cliente
            };

            return reservaDetalle;
        }

        // PUT: api/Reservas/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutReserva(int id, Reserva reserva)
        {
            if (id != reserva.id)
            {
                return BadRequest();
            }

            _context.Entry(reserva).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReservaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Reservas
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Reserva>> PostReserva(Reserva reserva)
        {
            _context.Reservas.Add(reserva);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetReserva", new { id = reserva.id }, reserva);
        }

        // DELETE: api/Reservas/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Reserva>> DeleteReserva(int id)
        {
            var reserva = await _context.Reservas.FindAsync(id);
            if (reserva == null)
            {
                return NotFound();
            }

            _context.Reservas.Remove(reserva);
            await _context.SaveChangesAsync();

            return reserva;
        }

        private bool ReservaExists(int id)
        {
            return _context.Reservas.Any(e => e.id == id);
        }
    }
}
