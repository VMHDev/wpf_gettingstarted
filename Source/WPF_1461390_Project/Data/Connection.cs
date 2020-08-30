using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace WPF_1461390_Project
{
    class Connection
    {
        public SqlConnection connection = new SqlConnection();

        public void openCon()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["DivingSuit"].ConnectionString;
                connection.ConnectionString = conStr;
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không kết nối được với cơ sở dữ liệu!!!");
            }
            
        }

        public void closeCon()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public DataTable dtTable = new DataTable();
        public DataTable getDataTable(string strQuery)
        {
            try
            {
                openCon();
                SqlCommand cmd = new SqlCommand(strQuery, connection);
                SqlDataReader dr = cmd.ExecuteReader();
                dtTable.Load(dr);
            }
            catch (System.Exception)
            {
                dtTable = null;
            }
            finally
            {
                closeCon();
            }

            return dtTable;
        }
    }
}
