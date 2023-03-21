using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ejercicioHoteles.Data;
using ejercicioHoteles.Models;

namespace ejercicioHoteles
{
    [Route("api/[controller]")]
    [ApiController]
    public class HabitacionController : ControllerBase
    {
        private readonly ejercicioHotelesContext _context;

        public HabitacionController(ejercicioHotelesContext context)
        {
            _context = context;
        }

        // GET: api/Habitacion
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Habitacion>>> GetHabitacion()
        {
            return await _context.Habitaciones.ToListAsync();
        }

        // GET: api/Habitacion/HabitacionesDisponiblesPorHotel?idHotel=
        [HttpGet("{id}")]
        [Route("HabitacionesDisponiblesPorHotel")]
        public async Task<ActionResult<IEnumerable<Habitacion>>> GetHabitacionesDisponiblesPorHotel(int idHotel)
        {
            List<Habitacion> habitaciones = await _context.Habitaciones.ToListAsync();
            habitaciones = habitaciones.Where(x => x.Id_hotel == idHotel).ToList();
            return habitaciones;
        }

        // GET: api/Habitacion/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Habitacion>> GetHabitacion(int id)
        {
            var habitacion = await _context.Habitaciones.FindAsync(id);

            if (habitacion == null)
            {
                return NotFound();
            }

            return habitacion;
        }

        // PUT: api/Habitacion/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHabitacion(int id, Habitacion habitacion)
        {
            if (id != habitacion.Id)
            {
                return BadRequest();
            }

            _context.Entry(habitacion).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HabitacionExists(id))
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

        // POST: api/Habitacion
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Habitacion>> PostHabitacion(Habitacion habitacion)
        {
            _context.Habitaciones.Add(habitacion);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetHabitacion", new { id = habitacion.Id }, habitacion);
        }

        // DELETE: api/Habitacion/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Habitacion>> DeleteHabitacion(int id)
        {
            var habitacion = await _context.Habitaciones.FindAsync(id);
            if (habitacion == null)
            {
                return NotFound();
            }

            _context.Habitaciones.Remove(habitacion);
            await _context.SaveChangesAsync();

            return habitacion;
        }

        private bool HabitacionExists(int id)
        {
            return _context.Habitaciones.Any(e => e.Id == id);
        }
    }
}
