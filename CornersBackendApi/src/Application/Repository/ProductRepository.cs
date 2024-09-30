using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using CornersBackendApi.src.Infrastructure.Persistence.Data;

namespace CornersBackendApi.src.Application.Repository
{
    public class ProductRepository : GenericRepository<Products>, IProductRepository
    {
        private readonly ApplicationDbContext _context;

        public ProductRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
