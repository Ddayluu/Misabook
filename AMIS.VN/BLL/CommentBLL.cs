using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DLL;

namespace BLL
{
    public class CommentBLL
    {
        CommentDLL _commentDLL;

        public CommentBLL()
        {
            _commentDLL = new CommentDLL();
        }

        public void PostComment(Comment comment)
        {
            _commentDLL.PostComment(comment);
        }
    }
}
