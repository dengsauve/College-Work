//#############
/* Notes Here
Right click > new item
select class
create a new class called tools
creates a new cs file called tools.cs


*/
//#############

//This is the name of the solution
namespace CalcArea
{
  public partial class Form1 : Form
  {
    //This is a constructor
    public Form1()
    {
      InitializeCompontent();
    }

    private btnWhatever_Click()
    {
      Tools myTools = new Tools();
      lblWhatevx.Text = myTools.myint.ToString();
    }
  }
}

namespace CalcArea
{
  class Tools
  {
    public int myint = 9;
  }
}
