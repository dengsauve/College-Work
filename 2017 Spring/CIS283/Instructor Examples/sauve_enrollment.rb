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

def prompt(string) # takes a string please_enter, returns answer
  print string
  gets.chomp.upcase
end

# get input from user (checks for exit at while loop)
department = prompt('Enter Department or EXIT: ')

# read the text file of classes
enrollment = File.open('Enrollment.txt', 'rb').read

while department != 'EXIT' # setup ~endless loop for looking for classes

  # get input from user
  class_number = prompt('Enter Class Number: ')

  # boolean for printing sub-lines
  class_active = false

  enrollment.split("\n").each do |line| #split for line-by-line search
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

  # get input from user, placed at bottom to get rid of IF statement/break
  department = prompt('Enter Department or EXIT: ')
end