using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Access_Layer;
using Entities;

namespace Business_Logic_Layer
{
    public class UserBLL
    {
        // Construct DLL
        UserDAL userDAL;

        public UserBLL()
        {
            userDAL = new UserDAL();
        }

        public bool CheckUserLogIn(string userName, string passWord)
        {
            return userDAL.CheckUserLogIn(userName, passWord);
        }

        public List<Post> getPostList()
        {
            return userDAL.getPostList();
        }
    }

}

