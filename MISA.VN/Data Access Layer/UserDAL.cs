using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer
{
    public class UserDAL
    {
        DatabaseAccess databaseAccess;
        public UserDAL()
        {
            databaseAccess = new DatabaseAccess();
        }
        /// <summary>
        /// Get information from database to check
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="passWord"></param>
        /// <returns></returns>
        public bool CheckUserLogIn(string userName, string passWord)
        {
            return databaseAccess.CheckUserInfo(userName, passWord);
        }
    }
}
