using System;
using System.Windows;
using System.Windows.Controls;
using WPF_1461390_Project.UserControls;

namespace WPF_1461390_Project
{
    /// <summary>
    /// Interaction logic for ImportExcell.xaml
    /// </summary>
    public partial class ImportExcell : Window
    {
        public ImportExcell()
        {
            InitializeComponent();
        }

        public string FileName
        {
            get { return txtBrowse.Text; }
            set { txtBrowse.Text = value; }
        }

        public event EventHandler<EventArgs> FileNameChanged;
        private void txtBrowse_TextChanged(object sender, TextChangedEventArgs e)
        {
            e.Handled = true;
            if (FileNameChanged != null)
                FileNameChanged(this, EventArgs.Empty);
        }

        private void btnBrowse_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();
            openFileDlg.Filter = "Excel Files|*.xls;*.xlsx;*.xlsm";
            if (openFileDlg.ShowDialog() == true)
                this.FileName = openFileDlg.FileName;
        }

        public delegate void PathDelegate(string data);
        public event PathDelegate Handler;

        private void btnOK_Click(object sender, RoutedEventArgs e)
        {
            if (Handler != null)
                Handler(FileName);
            this.Close();
        }
    }
}
