using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer
{
    public class DatabaseAccess
    {
        string _connectionString = @"Data Source=NHATQUANG;Initial Catalog=MISA.DemoAMIS;Integrated Security=True";
        //string _connectionString = @"Data Source=LUTA19F;Initial Catalog=MisaBookTest;Integrated Security=True";
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
        /// Get the post information on screen
        /// </summary>
        /// <returns></returns>
        public List<Post> GetPostList()
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
                // Thêm đối tượng vào List:
                posts.Add(post);
            }
            return posts;
        }
    }
}
