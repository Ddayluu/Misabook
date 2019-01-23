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
    public class CommentController : ApiController
    {
        CommentBLL _commentBLL;

        public CommentController()
        {
            _commentBLL = new CommentBLL();
        }
        public void PostComment(Comment comment)
        {
            _commentBLL.PostComment(comment);
        }
    }
}
