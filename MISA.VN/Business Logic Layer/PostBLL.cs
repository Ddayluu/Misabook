using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data_Access_Layer;
using Entities;

namespace Business_Logic_Layer
{
    public class PostBLL
    {
        PostDAL _postDAL;

        public PostBLL()
        {
            _postDAL = new PostDAL();
        }

        public List<Post> GetPostList()
        {
            return _postDAL.GetPostList();
        }
    }
}
