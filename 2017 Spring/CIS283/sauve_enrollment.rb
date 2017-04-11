############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/12/17
#  Assignment:   Text Search with Regular Expressions
#  Class:        CIS283
#  Description:  A program that will search through a data
#                file using regular expressions.
#                Extra Credit Attempted.
#
############################################################

# setup endless loop for looking for classes
department = ''
# read the text file of classes
enrollment = File.open('Enrollment.txt', 'rb').read

while department != 'EXIT'

  # get input from user
  print 'Enter Department: '
  department = gets.chomp.upcase
  print 'Enter Class Number: '
  class_number = gets.chomp

  # boolean for printing sub-lines
  class_active = false

  enrollment.split("\n").each do |line|

    # checking to see if the line is a sub-line, and if it's looking for a sub-line for a class
    if line[5] == ' ' and class_active == true
      puts line
    else
      class_active = false # gets reset whenever there's a new value in line[5] other than ' '
    end

    # checks for department abbr. + space(s) and the class number
    if line =~ /#{department}\s+#{class_number}/
      puts line
      class_active = true # telling the first if/else to look for a sub-line
    end
  end
end