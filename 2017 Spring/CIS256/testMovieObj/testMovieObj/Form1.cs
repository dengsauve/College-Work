using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testMovieObj
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MovieObj.oMovieCalc test = new MovieObj.oMovieCalc(11, 3, true);
            lblNumTickets.Text = test.NumTickets.ToString();
            lblTheater.Text = test.TheaterNumber.ToString();
            lblIsStudent.Text = test.isStudent.ToString();
            lblCost.Text = test.GetCost().ToString();

            MovieObj.oMovieCalc helper = new MovieObj.oMovieCalc();
            helper.NumTickets = 11;
            helper.TheaterNumber = 3;
            helper.isStudent = true;
            lblHlpTickets.Text = helper.NumTickets.ToString();
            lblHlpTheater.Text = helper.TheaterNumber.ToString();
            lblHlpStudent.Text = helper.isStudent.ToString();
            lblHlpCost.Text = helper.GetCost().ToString();

            MovieObj.oMovieCalc method = new MovieObj.oMovieCalc();
            lblMthGetCost.Text = method.GetCost(11, 3, true).ToString();
        }
    }
}
