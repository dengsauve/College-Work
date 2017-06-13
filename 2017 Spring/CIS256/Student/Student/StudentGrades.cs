using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        private List<string> oCourseCompleted;
        private List<string> oCourseQtrYr;
        private List<double> oCourseGrade;

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
    }
}
