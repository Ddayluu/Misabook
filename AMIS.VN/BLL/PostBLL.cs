using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DLL;
using Entity;

namespace BLL
{
    public class PostBLL
    {
        PostDLL _postDLL;

        public PostBLL()
        {
            _postDLL = new PostDLL();
        }

        public List<Post> GetListPosts()
        {
            return _postDLL.GetListPosts();
        }

    }
}
