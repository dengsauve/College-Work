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
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            double baseCost = 7.50;
            baseCost = baseCost * (int)numTickets.Value;

            if (txtTheater.Text == "2")
            {
                baseCost = baseCost * 0.75;
            }
            else if(txtTheater.Text == "3")
            {
                baseCost += 5.0;
            }

            if (chkIsStudent.Checked)
            {
                baseCost -= 2.0;
            }

            baseCost = Math.Round(baseCost, 1);

            lblTotal.Text = "$" + baseCost.ToString() + "0";
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
            lblTotal.Text = "$";
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
    }
}
