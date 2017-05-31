using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieObj
{
    public class oMovieCalc
    {
        private bool oIsStudent;
        private int oNumTickets;
        private int oTheaterNumber;

        public oMovieCalc()
        {
            // helpers will populate variables
        }

        public oMovieCalc(int tickets, int theater, bool student)
        {
            oIsStudent = student;
            oNumTickets = tickets;
            oTheaterNumber = theater;
        }

        public int TheaterNumber
        {
            get
            {
                return oTheaterNumber;
            }

            set
            {
                oTheaterNumber = value;
            }
        }

        public int NumTickets
        {
            get
            {
                return oNumTickets;
            }

            set
            {
                oNumTickets = value;
            }
        }

        public bool isStudent
        {
            get
            {
                return oIsStudent;
            }

            set
            {
                oIsStudent = value;
            }
        }

        public double GetCost()
        {
            double returnCost = 0.0;

            if (oTheaterNumber == 2)
            // Theater 2 is 3D and there is a $3.00 surcharge per ticket.
            {
                returnCost = 13.00 * oNumTickets;
            }
            else if(oTheaterNumber == 3)
            // Theater 3 are classics and there is a $0.50 discount per ticket.
            {
                returnCost = 9.50 * oNumTickets;
            }
            else
            {
                returnCost = 10.00 * oNumTickets;
            }

            if (oIsStudent)
            // Students get a $2.00 discount off each ticket purchased.
            {
                returnCost = returnCost - 2;
            }

            return returnCost;
        }

        public double GetCost(int tickets, int theater, bool student)
        {
            double returnCost = 0.0;

            if (theater == 2)
            // Theater 2 is 3D and there is a $3.00 surcharge per ticket.
            {
                returnCost = 13.00 * tickets;
            }
            else if (theater == 3)
            // Theater 3 are classics and there is a $0.50 discount per ticket.
            {
                returnCost = 9.50 * tickets;
            }
            else
            {
                returnCost = 10.00 * tickets;
            }

            if (student)
            // Students get a $2.00 discount off each ticket purchased.
            {
                returnCost = returnCost - 2;
            }

            return returnCost;
        }
    }
}
