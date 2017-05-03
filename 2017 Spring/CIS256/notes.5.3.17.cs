//Notes 5/3/17

// Watch online lectures on methods. There are 3 total lectures
// Dealing with void methods and parameters

// How to create some methods

// Let's work on Overloads!

private double getArea(double side) //square
{
	double dblArea = side*side
	return dblArea;
}

private double getArea(int side) //square
{
	double dblArea = side*side;
	return dblArea;
}

private double getArea(double length, double width) // This works because this getArea() takes two arguments - Rectangle
{
	//double dblArea = length*width;
	//return dblArea;
	return length*width; // Shortcuts
}

private double getArea(double side, bool isCircle)
{
	double dblArea;
	if isCircle
	{
		dblArea = Math.Pi * (side*side);
	}
	else
	{
		dblArea = side*side;
	}
	return dblArea;
}

// Throw a label on the form lblOutput, set text to '0'
// Add a textbox called txtSide
// Add a 'Calculate' button
// Add a second text box and rename to txtLength and the other to txtWidth

private void btnCalculate_Click(object sender, EventArgs e)
{
	lblOutput.Text = getArea(double.Parse(txtSide.Text)).ToString();
}

private void btnCalculate_Click(object sender, EventArgs e)
{
	//lblOutput.Text = getArea(double.Parse(txtLength.Text), double.Parse(txtWidth.Text)).ToString();
	int num2 = int.Parse(txtWidth.Text);
	int num1 = int.Parse(txtLength.Text);
	lblOutput.Text = getArea(num1, num2).ToString();
}


private void btnCalculate_Click(object sender, EventArgs e)
{
	int num1 = int.Parse(txtSide.Text);
	lblOutput.Text = getArea(num1, true).ToString(); // returns the area of a circle
	lblOutput.Text = getArea(num1, false).ToString(); // returns the area of a square
}

private void changeBK()
{
	This.BackColor = Color.Yellow;
}

private void changeBK(Color myColor)
{
	This.BackColor = myColor;
}

private void btnChangeColor_Click(object sender, EventArgs e)
{
	colorDialog1.ShowDialog(); // This has to be dragged on the to form btw
	Color myColor = colorDialog1.Color;
	changeBK(myColor);
}
























