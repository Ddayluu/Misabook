using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Comment
    {
        // Primary key
        public Guid CommentID { get; set; }

        public Guid PostID { get; set; }

        public Guid UserID { get; set; }

        public string CommentContent { get; set; }

        public string UserName { get; set; }

        public int LikeCount { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
