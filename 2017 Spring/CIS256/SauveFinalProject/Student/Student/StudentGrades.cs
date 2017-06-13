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
            return firstName + " " + lastName;
        }

        public string getName(string firstName, string lastName, string middleName)
        {
            return firstName + " " + middleName + " " + lastName;
        }

        public string getAddress()
        {
            string name;
            if (oMiddleName == "")
            {
                name = oFirstName + " " + oLastName;
            }
            else
            {
                name = oFirstName + " " + oMiddleName + " " + oLastName;
            }
            string cityState = zipLookup(oZip);

            return name + "\n" + oAddress + "\n" + cityState + " " + oZip;
        }

        public string getAddress(string zip)
        {
            string name;
            if (oMiddleName == "")
            {
                name = oFirstName + " " + oLastName;
            }
            else
            {
                name = oFirstName + " " + oMiddleName + " " + oLastName;
            }
            string cityState = zipLookup(zip);

            return name + "\n" + oAddress + "\n" + cityState + " " + zip;
        }

        public List<string> getClassList()
        {
            List<string> classesPassed = new List<string>();
            for (var i = 0; i < oCourseCompleted.Count; i++)
            {
                if(oCourseGrade[i] >= 1.0)
                {
                    classesPassed.Add(oCourseCompleted[i]);
                }
            }
            return classesPassed;
        }

        public List<string> getClassList(List<string> courses, List<float> grades)
        {
            List<string> classesPassed = new List<string>();
            for (var i = 0; i < courses.Count; i++)
            {
                if (grades[i] >= 1.0)
                {
                    classesPassed.Add(courses[i]);
                }
            }
            return classesPassed;
        }

        public List<string> getClassFailList()
        {
            List<string> classesFailed = new List<string>();
            for (var i = 0; i < oCourseCompleted.Count; i++)
            {
                if (oCourseGrade[i] <= 1.0)
                {
                    classesFailed.Add(oCourseCompleted[i]);
                }
            }
            return classesFailed;
        }

        public List<string> getClassFailList(List<string> courses, List<float> grades)
        {
            List<string> classesFailed = new List<string>();
            for (var i = 0; i < courses.Count; i++)
            {
                if (grades[i] <= 1.0)
                {
                    classesFailed.Add(courses[i]);
                }
            }
            return classesFailed;
        }

        public double getGPA()
        {
            if(oCourseGrade.Count() > 0)
            {
                return oCourseGrade.Average();
            }
            else
            {
                return 0.0;
            }
            
        }

        public bool isHonorRoll()
        {
            if (oCourseGrade.Count() > 0)
            {
                return 3.5 >= oCourseGrade.Average();
            }
            else
            {
                return false;
            }
        }

        public int getTimeAsStudent()
        {
            return Convert.ToInt32((DateTime.Today - oEnrolledDate).TotalDays);
        }

        private string zipLookup(string zip)
        {
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
            string city;
            string state;
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
            return city + ", " + state;
        }

    }
}
