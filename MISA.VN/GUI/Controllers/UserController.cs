using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Business_Logic_Layer;

namespace GUI.Controllers
{
    public class UserController : ApiController
    {
        UserBLL userBLL;

        /// <summary>
        /// get User information to check
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="passWord"></param>
        /// <returns></returns>
        [HttpGet]
        public bool CheckInfoLogIn(string userName, string passWord)
        {
            userBLL = new UserBLL();
            return userBLL.CheckUserLogIn(userName, passWord);
        }
    }
}
