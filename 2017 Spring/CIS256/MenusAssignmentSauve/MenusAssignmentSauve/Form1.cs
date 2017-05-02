using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MenusAssignmentSauve
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            lblSubTotal.Text = "";
            lblCharge.Text = "";
            lblStudentDiscount.Text = "";
            lblGrand.Text = "";
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            double baseCost = 7.50;
            baseCost = baseCost * (int)numTickets.Value;
            lblSubTotal.Text = "$" + Math.Round(baseCost, 1).ToString() + "0";

            if (txtTheater.Text == "2")
            {
                lblCharge.Text = "-$" + Math.Round(baseCost * 0.25, 1).ToString() + "0";
                lblCharge.ForeColor = Color.Green;
                baseCost = baseCost * 0.75;
            }
            else if(txtTheater.Text == "3")
            {
                lblCharge.Text = "$5.00";
                lblCharge.ForeColor = Color.Black;
                baseCost += 5.0;
            }
            else
            {
                lblCharge.Text = "$0.00";
                lblCharge.ForeColor = Color.Black;
            }

            if (chkIsStudent.Checked)
            {
                lblStudentDiscount.Text = "-$2.00";
                lblStudentDiscount.ForeColor = Color.Green;
                baseCost -= 2.0;
            }
            else
            {
                lblStudentDiscount.Text = "$0.00";
                lblStudentDiscount.ForeColor = Color.Black;
            }

            baseCost = Math.Round(baseCost, 1);

            lblGrand.Text = "$" + baseCost.ToString() + "0";
        }

        private void menuItemExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void menuItemClear_Click(object sender, EventArgs e)
        {
            txtTheater.Text = "";
            numTickets.Value = 1;
            chkIsStudent.Checked = false;
            lblSubTotal.Text = "";
            lblCharge.Text = "";
            lblCharge.ForeColor = Color.Black;
            lblStudentDiscount.Text = "";
            lblStudentDiscount.ForeColor = Color.Black;
            lblGrand.Text = "";
            txtTheater.Focus();
        }

        private void menuItemCalculate_Click(object sender, EventArgs e)
        {
            btnCalculate.PerformClick();
        }

        private void calculateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            btnCalculate.PerformClick();
        }

        private void clearToolStripMenuItem_Click(object sender, EventArgs e)
        {
            menuItemClear.PerformClick();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            menuItemExit.PerformClick();
        }

        private void toolStripCalculate_Click(object sender, EventArgs e)
        {
            btnCalculate.PerformClick();
        }

        private void toolStripClear_Click(object sender, EventArgs e)
        {
            menuItemClear.PerformClick();
        }
    }
}
