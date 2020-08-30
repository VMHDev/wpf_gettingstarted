using Aspose.Cells;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows;
//using WPF_1461390_Project.ViewModels;

namespace WPF_1461390_Project
{
    class Data
    {
        public DataTable exportDataFromExcell(int indexTable, string pathFile)
        {            
            FileStream fstream = new FileStream(pathFile, FileMode.Open);
            
            Workbook workbook = new Workbook(fstream);

            //Accessing the first worksheet in the Excel file
            Worksheet worksheet = workbook.Worksheets[indexTable];

            //Exporting the contents of 7 rows and 2 columns starting from 1st cell to DataTable
            DataTable dtTable = worksheet.Cells.ExportDataTable(0, 0, worksheet.Cells.MaxRow + 1, worksheet.Cells.MaxColumn + 1, true);

            //Closing the file stream to free all resources
            fstream.Close();

            return dtTable;
        }

        public bool copyCatTableToSQLTable(DataTable dt)
        {
            Connection con = new Connection();
            try
            {
                con.openCon();
                string sqlDELETE = "DELETE FROM Categories";
                SqlCommand cmdDel = new SqlCommand(sqlDELETE, con.connection);
                cmdDel.ExecuteNonQuery();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string sqlINSERT = "INSERT INTO Categories(CatID, CatName) VALUES(@catID, @catName)";
                    SqlCommand cmdIns = new SqlCommand(sqlINSERT, con.connection);
                    cmdIns.Parameters.AddWithValue("catID", dt.Rows[i]["CatID"].ToString().Trim());
                    cmdIns.Parameters.AddWithValue("catName", dt.Rows[i]["CatName"].ToString().Trim());
                    int result = cmdIns.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                MessageBox.Show("Lỗi!!!");
                return false;
            }
            return true;
        }

        public bool copyProTableToSQLTable(DataTable dt)
        {
            Connection con = new Connection();
            try
            {
                con.openCon();
                string sqlDELETE = "DELETE FROM Products";
                SqlCommand cmdDel = new SqlCommand(sqlDELETE, con.connection);
                cmdDel.ExecuteNonQuery();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string p = dt.Rows[i]["Price"].ToString().Trim();
                    int price;
                    if (p == "")
                    {
                        price = -1;
                    }
                    else
                    {
                        price = int.Parse(dt.Rows[i]["Price"].ToString().Trim());
                    }

                    string q = dt.Rows[i]["Quantity"].ToString().Trim();
                    int quantity;
                    if (q == "")
                    {
                        quantity = 0;
                    }
                    else
                    {
                        quantity = int.Parse(dt.Rows[i]["Quantity"].ToString().Trim());
                    }     

                    string sqlINSERT = "INSERT INTO Products(ProID,ProName, TinyDes, Price, Quantity,CatID) VALUES (@proID, @proName, @tinyDes, @price, @quantity, @catID)";
                    SqlCommand cmdIns = new SqlCommand(sqlINSERT, con.connection);
                    cmdIns.Parameters.AddWithValue("proID", dt.Rows[i]["ProID"].ToString().Trim());
                    cmdIns.Parameters.AddWithValue("proName", dt.Rows[i]["ProName"].ToString().Trim());
                    cmdIns.Parameters.AddWithValue("tinyDes", dt.Rows[i]["TinyDes"].ToString().Trim());
                    cmdIns.Parameters.AddWithValue("price", price);
                    cmdIns.Parameters.AddWithValue("quantity", quantity);
                    cmdIns.Parameters.AddWithValue("catID", dt.Rows[i]["CatID"].ToString().Trim());
                    int result = cmdIns.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                MessageBox.Show("Lỗi!!!!");
                return false;
            }
            return true;
        }

        //indexTable: 0 - Categories ; 1 - Products
        public void importDataToSQL(int indexTable, string pathSourceTable)
        {
            DataTable dt = exportDataFromExcell(indexTable, pathSourceTable);
            if (indexTable == 0)
            {
                bool result = copyCatTableToSQLTable(dt);
                if (result)
                {
                    MessageBox.Show("Nhập danh sách danh mục từ Excell thành công!!!");
                }
                else
                {
                    MessageBox.Show("Thất bại!!!");
                }
            }
            if (indexTable == 1)
            {
                bool result = copyProTableToSQLTable(dt);
                if (result)
                {
                    MessageBox.Show("Nhập danh sách sản phẩm từ Excell thành công!!!");
                }
                else
                {
                    MessageBox.Show("Thất bại!!!");
                }
            }
        }
    }
}
