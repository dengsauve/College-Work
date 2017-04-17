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

        }



        private void btnLookup_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtZip.Text))
            {
                MessageBox.Show("You need to enter a Zip Code.", "ZipLookup", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                var strZipCode = txtZip.Text;
                int i = bindingSource1.Find("zip", strZipCode);
                if (i < 0)
                {
                    lblCity.Text = "";
                    lblState.Text = "";
                }
                else
                {
                    bindingSource1.Position = i;
                    DataRowView items = (DataRowView)bindingSource1.List[i];
                    lblCity.Text = items["city"].ToString();
                    lblState.Text = items["state"].ToString();
                }
            }

        }




        private void lblCity_Click(object sender, EventArgs e){}
    }
}
