using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Post
    {
        // Primary key
        public Guid PostID { get; set; }

        public Guid UserID { get; set; }

        public Guid CommentID { get; set; }

        public string PostContent { get; set; }

        public string FullName { get; set; }

        public string UserName { get; set; }

        public string ProfilePicture { get; set; }

        public int LikeCount { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
