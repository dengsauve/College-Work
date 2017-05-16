using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bowwow
{
    public class Dog
    {
        private string oBreed;
        private string oDogName;
        private int oAgeYears;

        public Dog(int age)
        {
            oAgeYears = age;
        }

        public Dog()
        {
        }

        public string DogName
        {
            get
            {
                return oDogName;
            }

            set
            {
                oDogName = value;
            }
        }

        public string Breed
        {
            get
            {
                return oBreed;
            }

            set
            {
                oBreed = value;
            }
        }

        public int AgeYears
        {
            get
            {
                return oAgeYears;
            }

            set
            {
                oAgeYears = value;
            }
        }

        public int GetAgeDays()
        {
            return oAgeYears * 365;
        }

        public int GetAgeDays(int year)
        {
            return year * 365;
        }
    }
}
