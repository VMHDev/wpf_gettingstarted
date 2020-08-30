using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPF_1461390_Project.ViewModels
{
    class Products
    {
        public string ProID { get; set; }
        public string ProName { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string CatID { get; set; }
        public string TinyDes
        {
            get
            {
                return String.Format("Thông tin chi tiết sản phẩm {0}:\n  {1}", this.ProName, this.TinyDes);
            }
            set { }
        }
    }
}
