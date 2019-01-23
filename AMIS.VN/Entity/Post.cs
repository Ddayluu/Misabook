using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Post
    {
        public Guid PostID { get; set; }

        public Guid UserID { get; set; }

        public string PostContent { get; set; }

        public string FullName { get; set; }

        public string UserName { get; set; }

        public string ProfilePicture { get; set; }

        public int LikeCount { get; set; }

        public int CommentCount { get; set; }

        public DateTime CreatedDate { get; set; }

        public List<Comment> CommentList { get; set; }
    }
}
