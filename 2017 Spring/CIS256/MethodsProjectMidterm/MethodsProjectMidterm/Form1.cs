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

        // IsInt Code ###### Separation ######
        private void btnIsInteger_Click(object sender, EventArgs e)
        {
            lblEvaluation.Text = IsInt(txtNumString.Text).ToString();
        }

        public bool IsInt(string testString)
        {
            int testTwo;
            if (int.TryParse(testString, out testTwo))
                {
                    return true;
                }
            return false;
        }

        // IsNumeric Code ###### Separation ######
        private void btnIsNumeric_Click(object sender, EventArgs e)
        {
            lblEvaluation.Text = IsNumeric(txtNumString.Text).ToString();
        }

        public bool IsNumeric(string testString)
        {
            double test = 0.0;
            if (double.TryParse(testString, out test))
            {
                return true;
            }
            return false;
        }

        // Zip Lookup Code ###### Separation ######
        private void btnGetLocation_Click(object sender, EventArgs e)
        {
            lblLocation.Text = getCityState(txtZip.Text);
        }

        public string getCityState(string zip)
        {
            String cnStr, strSQL;
            SqlConnection cn = new SqlConnection();
            cnStr = "Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er";
            strSQL = "SELECT city, state FROM dbo.tblZipcodes where zip='" + zip + "'";
            cn.ConnectionString = cnStr;
            cn.Open();
            SqlCommand cmd = new SqlCommand(strSQL, cn);
            SqlDataReader rdrZip = cmd.ExecuteReader();
            rdrZip.Read();
            if (rdrZip.HasRows)
            {
                string city = rdrZip["city"].ToString();
                string state = rdrZip["state"].ToString();
                cn.Close();
                return city + ", " + state;
            }
            else
            {
                cn.Close();
                return "Error";
            }
        }

        // Calculate Code ###### Separation ######
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
