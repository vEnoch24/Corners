namespace CornersBackendApi.Dto.SellerDtos
{
    public class SellerDto
    {
        public SellerDto(string Id, string Email, string Name, string Role)
        {
            this.Id = Id;
            this.Email = Email;
            this.Name = Name;
            this.Role = Role;
        }

        public string Id { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string Role { get; set; }
    }
}
