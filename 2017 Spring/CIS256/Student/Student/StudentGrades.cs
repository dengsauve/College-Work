using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Student
{
    public class StudentGrades
    {
        private string oFirstName;
        private string oMiddleName;
        private string oLastName;
        private string oId;
        private string oEmail;
        private string oPhone;
        private string oAddress;
        private string oZip;
        private string oMajor;
        private DateTime oEnrolledDate;
        private List<string> oCourseCompleted = new List<string>();
        private List<string> oCourseQtrYr = new List<string>();
        private List<double> oCourseGrade = new List<double>();

        public StudentGrades()
        {
            // Gotcha Constructor
        }

        public StudentGrades(string firstName, string lastName)
        {
            oFirstName = firstName;
            oLastName = lastName;
        }

        public StudentGrades(string firstName, string lastName, string middleName)
        {
            oFirstName = firstName;
            oLastName = lastName;
            oMiddleName = middleName;
        }

        public string Id
        {
            get
            {
                return oId;
            }
            set
            {
                oId = value;
            }
        }

        public string Email
        {
            get
            {
                return oEmail;
            }
            set
            {
                oEmail = value;
            }
        }

        public string Phone
        {
            get
            {
                return oPhone;
            }
            set
            {
                oPhone = value;
            }
        }

        public string Address
        {
            get
            {
                return oAddress;
            }
            set
            {
                oAddress = value;
            }
        }

        public string Zip
        {
            get
            {
                return oZip;
            }
            set
            {
                oZip = value;
            }
        }

        public string Major
        {
            get
            {
                return oMajor;
            }
            set
            {
                oMajor = value;
            }
        }

        public DateTime EnrolledDate
        {
            get
            {
                return oEnrolledDate;
            }
            set
            {
                oEnrolledDate = value;
            }
        }

        public string getName()
        {
            if(oMiddleName == "")
            {
                return oFirstName + " " + oLastName;
            }
            else
            {
                return oFirstName + " " + oMiddleName + " " + oLastName;
            }
        }

        public string getName(string firstName, string lastName)
        {
            return oFirstName + " " + oLastName;
        }

        public string getName(string firstName, string lastName, string middleName)
        {
            return oFirstName + " " + oMiddleName + " " + oLastName;
        }

        public string getAddress()
        {
            string city;
            string state;
            string name;
            if (oMiddleName == "")
            {
                name = oFirstName + " " + oLastName;
            }
            else
            {
                name = oFirstName + " " + oMiddleName + " " + oLastName;
            }

            // Initialize the Strings
            String cnStr, strSQL;

            SqlConnection cn = new SqlConnection();
            // NOTE: Could be SqlConnection cn = new SqlConnection("Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er");
            // This has the advantage of being short and sweet.

            cnStr = "Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er";
            // NOTE: Could also be cn.ConnectionString = "Data Source=134.39.173.35;Initial Catalog=Contributions;User ID=dsauve_w17;Password=HJpo11er";
            cn.ConnectionString = cnStr;

            // Open the connetion to the SQL Server
            cn.Open();

            // Create the SQL Query
            strSQL = "SELECT city, state FROM dbo.tblZipcodes where zip='" + oZip + "'";

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
                city = rdrZip["city"].ToString();
                state = rdrZip["state"].ToString();
            }
            else
            {
                city = "";
                state = "";
            }
            //Close the connection to SQl Server
            cn.Close();

            return name + "\n" + oAddress + "\n" + city + ", " + state + " " + oZip;
        }


    }
}
