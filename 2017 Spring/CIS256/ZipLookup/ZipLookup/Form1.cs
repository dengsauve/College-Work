using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

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

            var strQuerey = "SELECT zip, city, state FROM dbo.tblZipcodes";
            SqlConnection cn = new SqlConnection("Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er");

            //Note: The connection string defaults to SQL Server
            //cnStr = ;

            //Assign Connection string to the connection object
            //cn.ConnectionString = cnStr;
            //Open the connetion to the SQL Server
            cn.Open();
            //You would do something here

            //Close the connection to SQl Server
            cn.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
