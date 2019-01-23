using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BLL;

namespace GUI.Controllers
{
    public class UserController : ApiController
    {
        UserBLL _userBLL;

        /// <summary>
        /// Check thông tin người dùng
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpGet]
        public bool checkLoginInfo(string userName, string password)
        {
            _userBLL = new UserBLL();
            return _userBLL.CheckUserLogin(userName, password);
        }
    }
}
