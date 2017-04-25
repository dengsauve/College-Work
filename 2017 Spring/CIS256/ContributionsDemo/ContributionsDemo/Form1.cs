using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ContributionsDemo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsauve_w17DataSet.NASA_Facilities' table. You can move, or remove it, as needed.
            this.nASA_FacilitiesTableAdapter.Fill(this.dsauve_w17DataSet.NASA_Facilities);
            // TODO: This line of code loads data into the 'demoGuestDataSet.MusicGenre' table. You can move, or remove it, as needed.
            this.musicGenreTableAdapter.Fill(this.demoGuestDataSet.MusicGenre);

        }
    }
}
