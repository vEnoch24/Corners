using CornersBackendApi.Data.Models.BuyerModels;
using CornersBackendApi.Data.Models.SellerModels;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.Data
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
