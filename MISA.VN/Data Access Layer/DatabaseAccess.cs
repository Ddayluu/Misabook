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
        string _connectionString = @"Data Source=NHATQUANG;Initial Catalog=MISA.DemoAMIS;Integrated Security=True";
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
    }
}
