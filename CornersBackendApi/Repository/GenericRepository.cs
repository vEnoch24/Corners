using CornersBackendApi.Data;
using CornersBackendApi.Repository.Contracts;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.Repository
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        private readonly ApplicationDbContext _context;

        public GenericRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<T> Create(T entity)
        {
            await _context.AddAsync(entity);
            return entity;
        }

        public async Task Delete(T entity)
        {
            _context.Set<T>().Remove(entity);
        }

        public async Task<bool> Exists(Guid id)
        {
            var entity = await GetById(id);
            return entity != null;
        }

        public IQueryable<T> GetAllAsQueryable()
        {
            return _context.Set<T>().AsQueryable();
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _context.Set<T>().ToListAsync();
        }

        public async Task<T> GetById(Guid id)
        {
            return await _context.Set<T>().FindAsync(id);
        }

        public async Task Save()
        {
            await _context.SaveChangesAsync();
        }

        public async Task Update(T entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
        }
    }
}
