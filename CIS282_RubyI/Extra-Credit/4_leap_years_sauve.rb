############################################################
#
#  Name:         Dennis Sauve
#  Date:         03/02/17
#  Assignment:   Leap Years Extra Credit
#  Class:        CIS 282
#  Description:  Calculates Leap years in given range, even
#                accepting input where the start_year is
#                greater than the end_year... because why not?
#
############################################################
print 'enter a start year: '
start_date = gets.chomp.to_i
print 'enter a end year: '
end_date = gets.chomp.to_i
leap_years = []

if start_date <= end_date
  (start_date..end_date).each { |year| leap_years << year if (year % 4 == 0) and (year % 100 != 0 || year % 400 == 0)}
  puts "Leap Years between #{start_date} and #{end_date}: #{leap_years.join(', ')}."
elsif start_date > end_date
  (end_date..start_date).each { |year| leap_years << year if (year % 4 == 0) and (year % 100 != 0 || year % 400 == 0)}
  puts "Leap Years between #{start_date} and #{end_date}: #{leap_years.reverse.join(', ')}."
end