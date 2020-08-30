using System;
using System.Collections.Generic;
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

namespace WPF_1461390_Project.UserControls
{
    /// <summary>
    /// Interaction logic for UCBrowse.xaml
    /// </summary>
    public  partial class UCBrowse : UserControl
    {
        public UCBrowse()
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
            if (openFileDlg.ShowDialog() == true)
                this.FileName = openFileDlg.FileName;
        }
    }
}
