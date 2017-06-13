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

        public StudentGrades()
        {

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
    }
}
