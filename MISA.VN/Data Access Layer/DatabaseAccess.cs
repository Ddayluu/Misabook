using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer
{
    public class DatabaseAccess
    {
        //string _connectionString = @"Data Source=NHATQUANG;Initial Catalog=MISA.DemoAMIS;Integrated Security=True";
        string _connectionString = @"Data Source=LUTA19F;Initial Catalog=MisaBookTest;Integrated Security=True";
        SqlConnection _sqlConnection;
        SqlCommand _sqlCommand;
        /// <summary>
        /// Connect to the database
        /// </summary>
        public DatabaseAccess()
        {
            _sqlConnection = new SqlConnection(_connectionString);
            if (_sqlConnection.State == ConnectionState.Closed)
            {
                _sqlConnection.Open();
            }
        }
        /// <summary>
        /// Checking the legal User to log in
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="passWord"></param>
        /// <returns></returns>
        public bool CheckUserInfo(string userName, string passWord)
        {
            _sqlCommand = _sqlConnection.CreateCommand();
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.CommandText = "[dbo].[Proc_CheckLoginInfo]";
            _sqlCommand.Parameters.AddWithValue("@UserName", userName);
            _sqlCommand.Parameters.AddWithValue("@Password", passWord);
            bool res = (bool)_sqlCommand.ExecuteScalar(); 
            return res;
        }

     
        /// <summary>
        /// Get all the post to the newfeed
        /// </summary>
        /// <returns></returns>
        //public List<Post> getListPost()
        public List<Post> getPostList()       
        {
            _sqlCommand = _sqlConnection.CreateCommand();
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.CommandText = "[dbo].[Proc_GetPostList]";

            SqlDataReader reader = _sqlCommand.ExecuteReader();
            DataTable table = reader.GetSchemaTable();

            List<Post> posts = new List<Post>();
            //While loop for reading every line
            
            while (reader.Read())
            {
                Post post = new Post();

                post.PostID = reader.GetGuid(0);
                post.UserID = reader.GetGuid(1);
                post.PostContent = reader.GetString(2);
                post.CreatedDate = reader.GetDateTime(3);
                post.LikeCount = reader.GetInt32(4);
                post.UserName = reader.GetString(5);
                post.CommentID = reader.GetGuid(8);
                post.UserIDComment = reader.GetGuid(9);
                post.CommentContent = reader.GetString(10);

                posts.Add(post);
            }

            return posts;
        }
    }
}
