using Aspose.Cells;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WPF_1461390_Project.Models;

namespace WPF_1461390_Project
{
    /// <summary>
    /// Interaction logic for Category.xaml
    /// </summary>
    public partial class UCCategory : UserControl
    {
        public UCCategory()
        {
            InitializeComponent();
            //loadDataCat();
            loadDataCat();
        }

        //Sử dụng ADO.Net
        //public void loadDataCat()
        //{
        //    Connection con = new Connection();
        //    DataTable dt = new DataTable();
        //    string sqlSELECT = "SELECT * FROM Categories";
        //    dt = con.getDataTable(sqlSELECT);
        //    dtgCategory.ItemsSource = dt.DefaultView;
        //}

        bool started = false;
        int currentPage = 1;
        int totalPages;

        public void loadDataCat(int page = 1)
        {
            var db = new DIVINGSUITEntities();
            var lsCat = db.Categories.ToList();

            started = true;
            currentPage = page;
            int itemsPerPage = int.Parse((cmbItemsPerPage.SelectedItem as ComboBoxItem).Content.ToString());

            var query = from c in lsCat.Skip((page - 1) * itemsPerPage).Take(itemsPerPage)
                        where c.Exist == true
                        select c;

            int totalItems = lsCat.Count;
            totalPages = totalItems / itemsPerPage;

            if (totalPages == 0)
            {
                currentPage = 0;
            }
            
            int m = totalItems % itemsPerPage;
            if (m > 0)
            {
                totalPages++;
            }

            
            dtgCategory.ItemsSource = query;

            lblPageStatus.Content = $"Page {currentPage} of {totalPages}";
        }

        private void btnPreviousPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage > 1)
            {
                loadDataCat(currentPage - 1);
            }
        }

        private void btnNextPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage < totalPages)
            {
                loadDataCat(currentPage + 1);
            }
        }

        private void cmbItemsPerPage_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (started) loadDataCat();
        }

        private void txtKeyword_TextChanged(object sender, TextChangedEventArgs e)
        {
            var db = new DIVINGSUITEntities();
            var lsCat = db.Categories.ToList();
            var keyword = txtKeyword.Text;

            var query = from c in lsCat
                        where c.CatName.ToLower().Contains(keyword.ToLower()) && c.Exist == true
                        select c;

            dtgCategory.ItemsSource = query;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {
            Category cat = (Category)dtgCategory.SelectedItem;
            cat.Exist = false;
            var db = new DIVINGSUITEntities();
            db.Entry(cat).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            loadDataCat();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
