using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sauveMiniValueReturningMethods
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(String.IsNullOrWhiteSpace(txtQuantity.Text) && String.IsNullOrWhiteSpace(txtSalesTax.Text))
            {
                txtAnswer.Text = GetPrice(double.Parse(txtPrice.Text)).ToString();
            }else if (String.IsNullOrWhiteSpace(txtSalesTax.Text))
            {
                txtAnswer.Text = GetPrice(double.Parse(txtPrice.Text), double.Parse(txtQuantity.Text)).ToString();
            }else
            {
                txtAnswer.Text = GetPrice(double.Parse(txtPrice.Text), double.Parse(txtQuantity.Text), double.Parse(txtSalesTax.Text)).ToString();
            }
        }

        private double GetPrice(double price)
        {
            return price;
        }

        private double GetPrice(double price, double quantity)
        {
            return price * quantity;
        }

        private double GetPrice(double price, double quantity, double salesTax)
        {
            return price * quantity * (1 + salesTax);
        }
    }
}
