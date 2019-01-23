using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BLL;
using Entity;

namespace GUI.Controllers
{
    public class PostController : ApiController
    {
        PostBLL _postBLL;

        public PostController()
        {
            _postBLL = new PostBLL();
        }

        public List<Post> GetListPosts()
        {
            return _postBLL.GetListPosts();
        }
    }
}
