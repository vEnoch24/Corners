namespace BackendApi.Dto.SellerDtos
{
    public class SellerDto
    {
        public SellerDto(string Id, string Email, string Name)
        {
            this.Id = Id;
            this.Email = Email;
            this.Name = Name;
        }

        public string Id { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
    }
}
