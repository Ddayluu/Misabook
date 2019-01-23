using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DLL
{
    public class UserDLL
    {
        DataAccess _dataAccess;

        public UserDLL()
        {
            _dataAccess = new DataAccess();
        }

        public bool CheckUserLogin(string userName, string password)
        {
            return _dataAccess.CheckUserInfo(userName, password);
        }
    }
}
