using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace Data_Access_Layer
{
    public class PostDAL
    {
        DatabaseAccess _databaseAccess;
           
        public PostDAL()
        {
            _databaseAccess = new DatabaseAccess();
        }
        public List<Post> GetPostList()
        {
            return _databaseAccess.GetPostList();
        }
    }
}
