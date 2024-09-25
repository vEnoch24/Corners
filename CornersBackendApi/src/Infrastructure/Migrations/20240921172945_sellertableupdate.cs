using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CornersBackendApi.Migrations
{
    /// <inheritdoc />
    public partial class sellertableupdate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "Sellers");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Sellers",
                newName: "LastName");

            migrationBuilder.AddColumn<string>(
                name: "BusinessEmail",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "BusinessLocation",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "BusinessName",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "BusinessPhoneNumber",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "FirstName",
                table: "Sellers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BusinessEmail",
                table: "Sellers");

            migrationBuilder.DropColumn(
                name: "BusinessLocation",
                table: "Sellers");

            migrationBuilder.DropColumn(
                name: "BusinessName",
                table: "Sellers");

            migrationBuilder.DropColumn(
                name: "BusinessPhoneNumber",
                table: "Sellers");

            migrationBuilder.DropColumn(
                name: "FirstName",
                table: "Sellers");

            migrationBuilder.RenameColumn(
                name: "LastName",
                table: "Sellers",
                newName: "Name");

            migrationBuilder.AddColumn<int>(
                name: "PhoneNumber",
                table: "Sellers",
                type: "int",
                nullable: true);
        }
    }
}
