using CornersBackendApi.src.Domain.Entities.Models;
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
        public DbSet<Products> Products { get; set; }
        public DbSet<Order> Orders { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);


            // One-to-many relationship: User -> Orders
            modelBuilder.Entity<User>()
                .HasMany(u => u.Orders)
                .WithOne(o => o.User)
                .HasForeignKey(o => o.UserId);

            // One-to-many relationship: Seller -> Products
            modelBuilder.Entity<Seller>()
                .HasMany(s => s.Products)
                .WithOne(p => p.Seller)
                .HasForeignKey(p => p.SellerId);

            // Many-to-many relationship: Orders -> Products via OrderProduct
            modelBuilder.Entity<OrderProduct>()
                .HasKey(op => new { op.OrderId, op.ProductId });

            modelBuilder.Entity<OrderProduct>()
                .HasOne(op => op.Order)
                .WithMany(o => o.OrderProducts)
                .HasForeignKey(op => op.OrderId);

            modelBuilder.Entity<OrderProduct>()
                .HasOne(op => op.Product)
                .WithMany(p => p.OrderProducts)
                .HasForeignKey(op => op.ProductId);
        }

    }
}
