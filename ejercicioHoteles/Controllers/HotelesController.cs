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
    public class HotelesController : ControllerBase
    {
        private readonly ejercicioHotelesContext _context;

        public HotelesController(ejercicioHotelesContext context)
        {
            _context = context;
        }

        // GET: api/Hoteles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHoteles()
        {
            return await _context.Hoteles.ToListAsync();
        }

        // GET: api/Hoteles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Hotel>> GetHoteles(int id)
        {
            var hoteles = await _context.Hoteles.FindAsync(id);

            if (hoteles == null)
            {
                return NotFound();
            }

            return hoteles;
        }

        // PUT: api/Hoteles/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHoteles(int id, Hotel hoteles)
        {
            if (id != hoteles.Id)
            {
                return BadRequest();
            }

            _context.Entry(hoteles).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HotelesExists(id))
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

        // POST: api/Hoteles
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Hotel>> PostHoteles(Hotel hoteles)
        {
            _context.Hoteles.Add(hoteles);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetHoteles", new { id = hoteles.Id }, hoteles);
        }

        // DELETE: api/Hoteles/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Hotel>> DeleteHoteles(int id)
        {
            var hoteles = await _context.Hoteles.FindAsync(id);
            if (hoteles == null)
            {
                return NotFound();
            }

            _context.Hoteles.Remove(hoteles);
            await _context.SaveChangesAsync();

            return hoteles;
        }

        private bool HotelesExists(int id)
        {
            return _context.Hoteles.Any(e => e.Id == id);
        }
    }
}
