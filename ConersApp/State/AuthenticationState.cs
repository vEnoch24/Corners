using BackendClassLibrary.Dto;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConersApp.State
{
    public class AuthenticationState : INotifyPropertyChanged
    {
        public const string AuthStoreKey = "authkey";

        public event PropertyChangedEventHandler? PropertyChanged;

        //public Guid Id { get; set; }
        //public string? Name { get; set; }

        public UserDto User { get; set; } = default;
        public string? Token { get; set; }

        private bool _isAuthenticated;

        public bool IsAuthenticated
        {
            get => _isAuthenticated;
            set
            {
                if (_isAuthenticated != value)
                {
                    _isAuthenticated = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(IsAuthenticated)));
                }
            }
        }

        public void LoadState(AuthResponseDto authResponseDto)
        {
            //Id = authResponseDto.User.Id;
            //Name= authResponseDto.User.Name;
            User = authResponseDto.User;
            Token = authResponseDto.Token;
            IsAuthenticated = true;
        }
        public void UnLoadState()
        {
            //Name = null;
            User = default;
            Token = null;
            IsAuthenticated = false;
        }
    }
}
