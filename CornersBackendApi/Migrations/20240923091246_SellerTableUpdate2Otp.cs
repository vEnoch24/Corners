using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CornersBackendApi.Migrations
{
    /// <inheritdoc />
    public partial class SellerTableUpdate2Otp : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Otp",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "OtpExpiry",
                table: "Sellers",
                type: "datetime2",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Otp",
                table: "Sellers");

            migrationBuilder.DropColumn(
                name: "OtpExpiry",
                table: "Sellers");
        }
    }
}
