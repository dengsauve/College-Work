using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testBowwow
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Bowwow.Dog myDog = new Bowwow.Dog();
            myDog.DogName = "Bowser";
            myDog.Breed = "Irish Wolf Hound";
            myDog.AgeYears = 8;
            lblAge.Text = myDog.AgeYears.ToString();
            lblDogName.Text = myDog.DogName;
            lblBreed.Text = myDog.Breed;
            lblDogAgeDays.Text = myDog.GetAgeDays().ToString() + " Days";
        }
    }
}
