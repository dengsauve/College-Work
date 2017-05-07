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
        }

        private void label1_Click(object sender, EventArgs e){}

        private void btnZip_Click(object sender, EventArgs e)
        {
            // Initialize the Strings
            String cnStr, strSQL;

            SqlConnection cn = new SqlConnection();
            // NOTE: Could be SqlConnection cn = new SqlConnection("Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er");
            // This has the advantage of being short and sweet.

            cnStr = "Data Source=[Redacted];Initial Catalog=Contributions;User ID=[Redacted];Password=[Redacted]";
            // NOTE: Could also be cn.ConnectionString = "Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er";
            cn.ConnectionString = cnStr;

            // Open the connetion to the SQL Server
            cn.Open();

            // Create the SQL Query
            strSQL = "SELECT city, state FROM dbo.tblZipcodes where zip='" + txtZip.Text + "'";

            // Create the SqlCommand Object
            SqlCommand cmd = new SqlCommand(strSQL, cn);

            // Create the SqlDataReader Object from Executing the SqlCommand Object
            SqlDataReader rdrZip = cmd.ExecuteReader();

            // Read the data from the SqlDataReader
            rdrZip.Read();

            // Check to see if there are any results
            if (rdrZip.HasRows)
            {
                // Set the labels to the appropriate values
                lblCityDyn.Text = rdrZip["city"].ToString();
                lblStateDyn.Text = rdrZip["state"].ToString();
            }
            else
            {
                MessageBox.Show("Zip Not Found.");
            }
            //Close the connection to SQl Server
            cn.Close();
        }
    }
}
