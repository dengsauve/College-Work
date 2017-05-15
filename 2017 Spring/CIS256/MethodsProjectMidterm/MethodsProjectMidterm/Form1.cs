using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MethodsProjectMidterm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            //calculate();
            //oldCalculate(double.Parse(txtNum1.Text), double.Parse(TextNum2.Text));
            lblProduct.Text = calculate(double.Parse(txtNum1.Text), double.Parse(TextNum2.Text)).ToString();
        }

        public void calculate()
        {
            lblProduct.Text = (double.Parse(txtNum1.Text) * double.Parse(TextNum2.Text)).ToString();
        }

        public void oldCalculate(double num1, double num2)
        {
            lblProduct.Text = (num1 * num2).ToString();
        }

        public double calculate(double num1, double num2)
        {
            return num1 * num2;
        }
    }
}
