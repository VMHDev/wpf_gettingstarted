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
//using WPF_1461390_Project.ViewModels;

namespace WPF_1461390_Project
{
    /// <summary>
    /// Interaction logic for Product.xaml
    /// </summary>
    public partial class UCProduct : UserControl
    {
        public UCProduct()
        {
            InitializeComponent();
            //loadDataPro();
            updateDataPro();
        }

        public void loadDataPro()
        {
            Connection con = new Connection();
            DataTable dt = new DataTable();
            string sqlSELECT = "SELECT * FROM Products";
            dt = con.getDataTable(sqlSELECT);
            dtgProduct.ItemsSource = dt.DefaultView;
        }

        bool started = false;
        int currentPage = 1;
        int totalPages;
        int itemsPerPage;

        public void updateDataPro(int page = 1)
        {
            var db = new DIVINGSUITEntities();
            var lsPro = db.Products.ToList();
            started = true;

            currentPage = page;
            itemsPerPage = int.Parse((cmbItemsPerPage.SelectedItem as ComboBoxItem).Content.ToString());
            totalPages = lsPro.Count / itemsPerPage;
            int m = lsPro.Count % itemsPerPage;
            if (m > 0)
            {
                totalPages++;
            }

            var query = lsPro.Skip((page - 1) * itemsPerPage).Take(itemsPerPage);
            dtgProduct.ItemsSource = query;

            lblPageStatus.Content = $"Page {currentPage} of {totalPages}";
        }

        private void btnPreviousPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage > 1)
            {
                updateDataPro(currentPage - 1);
            }
        }

        private void btnNextPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage < totalPages)
            {
                updateDataPro(currentPage + 1);
            }
        }

        private void cmbItemsPerPage_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (started) updateDataPro();
        }

        private void txtKeyword_TextChanged(object sender, TextChangedEventArgs e)
        {
            var db = new DIVINGSUITEntities();
            var lsPro = db.Products.ToList();
            var keyword = txtKeyword.Text;

            var query = from p in lsPro where p.ProName.ToLower().Contains(keyword.ToLower()) select p;
            dtgProduct.ItemsSource = query;
        }
    }
}
