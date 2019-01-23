using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Reflection;

namespace DLL
{
    public class DataAccess
    {
        string _connectionString = "Data Source=KHOA-PC\\SQLEXPRESS;Initial Catalog=MISA.DemoAMIS;Integrated Security=True;MultipleActiveResultSets=true;";
        SqlConnection _sqlConnection;
        SqlCommand _sqlCommand;

        public DataAccess()
        {
            _sqlConnection = new SqlConnection(_connectionString);
            if (_sqlConnection.State == ConnectionState.Closed)
            {
                _sqlConnection.Open();
            }
        }

        public bool CheckUserInfo(string userName, string password)
        {
            _sqlCommand = _sqlConnection.CreateCommand();
            _sqlCommand.CommandType = CommandType.StoredProcedure;

            _sqlCommand.CommandText = "[dbo].[Proc_CheckLoginInfo]";
            _sqlCommand.Parameters.AddWithValue("@UserName", userName);
            _sqlCommand.Parameters.AddWithValue("@Password", password);

            bool result = (bool)_sqlCommand.ExecuteScalar();
            return result;
        }

        public List<Post> GetListPost()
        {
            List<Post> posts = new List<Post>();
            // Khởi tạo Sql Command để thao tác với dữ liệu:
            _sqlCommand = _sqlConnection.CreateCommand();

            // Chọn loại SqlCommand để thao tác với dữ liệu:
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.CommandText = "[dbo].[Proc_GetPostList]";

            // Khởi tạo đối tượng SqlDataReader để hứng dữ liệu trả về từ Store:
            SqlDataReader sqlDataReader = _sqlCommand.ExecuteReader();

            // Duyệt từng dòng dữ liệu trong Dataread
            while (sqlDataReader.Read())
            {
                var post = new Post();
                // Thực hiện đọc dữ liệu từng dòng->cột-> cell:
                for (int i = 0; i < sqlDataReader.FieldCount; i++)
                {
                    // Tên cột
                    string fieldName = sqlDataReader.GetName(i);

                    PropertyInfo property = post.GetType().GetProperty(fieldName);
                    // Nếu tên cột trùng với tên propery thì gán giá trị tương ứng:
                    if (property != null && sqlDataReader[fieldName] != DBNull.Value)
                    {
                        property.SetValue(post, sqlDataReader[fieldName], null);
                    }
                }
                //Get comment list from a post
                this.GetCommentList(post);
                // Thêm đối tượng vào List:
                posts.Add(post);
            }
            return posts;
        }

        /// <summary>
        /// Add all the comment list from database to a post
        /// </summary>
        /// <param name="post"></param>
        public void GetCommentList(Post post)
        {
            post.CommentList = new List<Comment>();

            _sqlCommand = _sqlConnection.CreateCommand();
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.CommandText = "[dbo].[Proc_GetCommentList]";
            _sqlCommand.Parameters.AddWithValue("@PostSearch", post.PostID);

            SqlDataReader sqlDataReader = _sqlCommand.ExecuteReader();

            while (sqlDataReader.Read())
            {
                var comment = new Comment();

                for (int i = 0; i < sqlDataReader.FieldCount; i++)
                {
                    // Tên cột
                    string fieldName = sqlDataReader.GetName(i);

                    PropertyInfo property = comment.GetType().GetProperty(fieldName);
                    // Nếu tên cột trùng với tên propery thì gán giá trị tương ứng:
                    if (property != null && sqlDataReader[fieldName] != DBNull.Value)
                    {
                        property.SetValue(comment, sqlDataReader[fieldName], null);
                    }
                }
                // Thêm đối tượng vào List:
                post.CommentList.Add(comment);
                post.CommentCount = post.CommentList.Count;
            }
        }

        public void PostComment(Comment comment)
        {
            _sqlCommand = _sqlConnection.CreateCommand();
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.CommandText = "[dbo].[Proc_PostComment]";
            _sqlCommand.Parameters.AddWithValue("@UserID", comment.UserID);
            _sqlCommand.Parameters.AddWithValue("@PostID", comment.PostID);
            _sqlCommand.Parameters.AddWithValue("@CommentContent", comment.CommentContent);
            _sqlCommand.Parameters.AddWithValue("@CreatedDate", comment.CreatedDate);
            _sqlCommand.Parameters.AddWithValue("@LikeCount", comment.LikeCount);

            _sqlCommand.ExecuteNonQuery();
        }
    }
}
