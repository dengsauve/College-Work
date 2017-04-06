############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/12/17
#  Assignment:   Text Search with Regular Expressions
#  Class:        CIS283
#  Description:  A program that will search through a data
#                file using regular expressions.
#
############################################################

print 'Enter Department: '
department = gets.chomp
print 'Enter Class Number: '
class_number = gets.chomp
enrollment = File.open('Enrollment.txt', 'rb').read.split("\n")

enrollment.each do |line|
  print /#{department}\s+#{class_number}/.match(line)
end