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