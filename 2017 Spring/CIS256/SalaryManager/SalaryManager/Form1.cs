using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SalaryManager
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsauve_w17DataSet.Salaries' table. You can move, or remove it, as needed.
            this.salariesTableAdapter.Fill(this.dsauve_w17DataSet.Salaries);
            // TODO: This line of code loads data into the 'dsauve_w17DataSet.Players' table. You can move, or remove it, as needed.
            this.playersTableAdapter.Fill(this.dsauve_w17DataSet.Players);

        }

        private void playersBindingSource_PositionChanged(object sender, EventArgs e)
        {
            this.Validate();
            this.playersBindingSource.EndEdit();
            //this.tableAdapterManager.UpdateAll(this.dsauve_w17DataSet);//doesn't work and crashes
            this.playersTableAdapter.Update(this.dsauve_w17DataSet.Players);//doesn't work either, but doesn't crash 
        }

        private void nameLastTextBox_TextChanged(object sender, EventArgs e)
        {
            playersBindingSource.Filter = "nameLast like '" + nameLastTextBox.Text + "%'";
        }

        private void yearIDTextBox_Leave(object sender, EventArgs e)
        {
            int placeholder;
            if (!int.TryParse(yearIDTextBox.Text, out placeholder))
            {
                MessageBox.Show("Please Enter a Valid Number.");
                yearIDTextBox.Text = "";
                yearIDTextBox.Focus();
            }
        }

        private void salaryTextBox_Leave(object sender, EventArgs e)
        {
            int placeholder;
            if (!int.TryParse(salaryTextBox.Text, out placeholder))
            {
                MessageBox.Show("Please Enter a Valid Number. You can't be paid in letters.");
                salaryTextBox.Text = "";
                salaryTextBox.Focus();
            }
        }

        private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewRow dgvr in dataGridView1.Rows)
            {
                dgvr.DefaultCellStyle.BackColor = Color.White;
            }
            dataGridView1.Rows[dataGridView1.CurrentRow.Index].DefaultCellStyle.BackColor = Color.Yellow;
        }
    }
}
