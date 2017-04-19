using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ZipLookup
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsauve_w17DataSet1.tblZipcodes' table. You can move, or remove it, as needed.
            this.tblZipcodesTableAdapter.Fill(this.dsauve_w17DataSet1.tblZipcodes);

        }

        private void tblZipcodesBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.tblZipcodesBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dsauve_w17DataSet1);

        }

        private void zipTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            tblZipcodesBindingSource.Filter = "zip='" + zipTextBox.Text + "'";
        }
    }
}
