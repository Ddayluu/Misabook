using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Business_Logic_Layer;
using Entities;

namespace GUI.Controllers
{
    public class PostController : ApiController
    {
        PostBLL _postBLL;

        /// <summary>
        /// Show user posts on the browser
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public List<Post> GetPostList()
        {
            _postBLL = new PostBLL();
            List<Post> userPosts = _postBLL.GetPostList();
            return userPosts;
        }
    }
}
