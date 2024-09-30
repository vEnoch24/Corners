using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Infrastructure.Persistence.Data;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.src.Application.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;

        private IProductRepository _productRepository;

        public UnitOfWork(ApplicationDbContext context, IProductRepository productRepository)
        {
            _context = context;
            _productRepository = productRepository;
        }

        public IProductRepository ProductRepository =>
            _productRepository ??= new ProductRepository(_context);

        public void Dispose()
        {
            _context.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
