// Problem 1
public void calculate()
		{
			lblProduct.Text = (double.Parse(txtNum1.Text) * double.Parse(TextNum2.Text)).ToString();
		}
	
// Problem 2
public void calculate(double num1, double num2)
        {
            lblProduct.Text = (num1 * num2).ToString();
        }
		
// Problem 3
public double calculate(double num1, double num2)
        {
            return num1 * num2;
        }

// Problem 4
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

// Problem 5 - 1
public bool IsNumeric(string testString)
        {
            double test = 0.0;
            if (double.TryParse(testString, out test))
            {
                return true;
            }
            return false;
        }
		
// Problem 5 - 2
public bool IsInt(string testString)
        {  
            int testTwo;
            if (int.TryParse(testString, out testTwo))
                {
                    return true;
                }
            return false;
        }

