using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DLL;
using Entity;

namespace BLL
{
    public class UserBLL
    {
        // Khởi tạo DLL;
        UserDLL _userDLL;

        public UserBLL()
        {
            _userDLL = new UserDLL();
        }

        public bool CheckUserLogin(string userName, string password)
        {
            return _userDLL.CheckUserLogin(userName, password);
        }
    }
}
