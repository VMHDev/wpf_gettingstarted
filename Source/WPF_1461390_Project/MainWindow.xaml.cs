using DevExpress.Xpf.Core;
using Fluent;
using System;
using System.IO;
using System.Windows;
using WPF_1461390_Project.UserControls;

namespace WPF_1461390_Project
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : RibbonWindow
    {
        public MainWindow()
        {
            //SplashScreen: Tạo độ trễ khi bắt đầu load chương trình:
            for (int i = 0; i < 50; i += 1)
            {
                System.Threading.Thread.Sleep(50);
                DXSplashScreen.Progress(i);
            }
            //>

            InitializeComponent();
        }

        //Khởi chạy SplashScreen:
        private void RibbonWindow_Loaded(object sender, RoutedEventArgs e)
        {
            DXSplashScreen.Close();
            this.contentControl.Content = new UCCategory();
        }
        //--->

        //Nhập lại dữ liệu danh mục sản phẩm từ excell:
        private void btnImportCat_Click(object sender, RoutedEventArgs e)
        {
            ImportExcell ipCat = new ImportExcell();
            ipCat.Handler += ipCat_Handler;
            ipCat.ShowDialog();
        }

        void ipCat_Handler(string path)
        {
            string pathExcell = path;
            if (pathExcell == "")
            {
                MessageBox.Show("Lỗi! Vui lòng thực hiện lại!!!");
            }
            else
            {
                this.contentControl.Content = new UCProduct();
                Data data = new Data();
                data.importDataToSQL(0, path);
            }
        }
        //--->

        //Nhập lại dữ liệu sản phẩm từ excell:
        private void btnImportPro_Click(object sender, RoutedEventArgs e)
        {
            ImportExcell ipPro = new ImportExcell();
            ipPro.Handler += ipPro_Handler;
            ipPro.ShowDialog();
        }

        void ipPro_Handler(string path)
        {
            string pathExcell = path;
            if (pathExcell == "")
            {
                MessageBox.Show("Lỗi! Vui lòng thực hiện lại!!!");
            }
            else
            {
                this.contentControl.Content = new UCProduct();
                Data data = new Data();
                data.importDataToSQL(1,path);
            }
        }
        //--->

        //Nhập lại toàn bộ dữ liệu từ excell:
        private void btnImportAll_Click(object sender, RoutedEventArgs e)
        {
            ImportExcell import = new ImportExcell();
            import.Handler += import_Handler;
            import.ShowDialog();
        }

        void import_Handler(string path)
        {
            string pathExcell = path;
            if (pathExcell == "")
            {
                MessageBox.Show("Lỗi! Vui lòng thực hiện lại!!!");
            }
            else
            {
                this.contentControl.Content = new UCCategory();
                Data data = new Data();
                data.importDataToSQL(0, path);
                data.importDataToSQL(1, path);                
            }
        }
        //--->

        //Hiện thị thông tin các sản phẩm:
        private void btnPro_Click(object sender, RoutedEventArgs e)
        {
            this.contentControl.Content = new UCProduct();
        }
        //--->


        //Hiện thị thông tin các danh mục:
        private void btnCata_Click(object sender, RoutedEventArgs e)
        {
            this.contentControl.Content = new UCCategory();
        }
        //--->

        //Hiện thị trợ giúp:
        private void btnHelp_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var dic = AppDomain.CurrentDomain.BaseDirectory;
                dic = dic + "DivingSuit.chm";
                System.Diagnostics.Process.Start(dic);
            }
            catch (Exception)
            {

                MessageBox.Show("Lỗi!!!", "Thông báo");
            } 
        }
        //--->
    }
}
