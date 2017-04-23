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

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void playersBindingSource_PositionChanged(object sender, EventArgs e)
        {
            this.Validate();
            this.playersBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dsauve_w17DataSet);
        }
    }
}
