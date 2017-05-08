using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MiniAssignmentsMasterForm
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

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            Fill_In(txtName.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtZip.Text);
        }

        private void Fill_In(string name, string address, string city, string state, string zip)
        {
            if (String.IsNullOrWhiteSpace(name)){
                this.txtName.Text = "Fake McName";
            }else{
                this.txtName.Text = name;
            }

            if (String.IsNullOrWhiteSpace(address))
            {
                this.txtAddress.Text = "123 Fakey Lane";
            }else{
                this.txtAddress.Text = address;
            }

            if (String.IsNullOrWhiteSpace(city))
            {
                this.txtCity.Text = "Fakesville";
            }else{
                this.txtCity.Text = city;
            }

            if (String.IsNullOrWhiteSpace(state))
            {
                this.txtState.Text = "Fakington";
            }else{
                this.txtState.Text = state;
            }

            if (String.IsNullOrWhiteSpace(zip))
            {
                this.txtZip.Text = "10270";
            }else{
                this.txtZip.Text = zip;
            }
        }
    }
}
