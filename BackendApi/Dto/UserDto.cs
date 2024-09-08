namespace BackendApi.Dto
{
    public class UserDto
    {
        public UserDto(string Id, string Email, string FirstName, string LastName)
        {
            this.Id = Id;
            this.Email = Email;
            this.FirstName = FirstName;
            this.LastName = LastName;
        }

        public string Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
