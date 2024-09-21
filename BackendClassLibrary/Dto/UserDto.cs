namespace BackendClassLibrary.Dto
{
    public class UserDto
    {
        public UserDto(string Id, string Email, string FirstName, string LastName, string Role)
        {
            this.Id = Id;
            this.Email = Email;
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Role = Role;
        }

        public string Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Role { get; set; }
    }
}
