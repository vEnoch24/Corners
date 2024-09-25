using CornersBackendApi.src.Domain.Entities.Models.BuyerModels;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.src.Infrastructure.Persistence.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<User> Users { get; set; }
        public DbSet<Seller> Sellers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

        }

    }
}
