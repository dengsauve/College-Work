############################################################
#
#  Name:         Dennis Sauve
#  Date:         1/12/17
#  Assignment:   Week 2 Project: Header
#  Class:        CIS 282
#  Description:  This assignment is for creating headers for assignments.
#
############################################################


print "Name: "
name = gets.chomp
print "Date: "
date = gets.chomp
print "Assignment: "
assignment = gets.chomp
print "Class Number: "
class_number = gets.chomp
print "Description: "
description = gets.chomp

puts "#" * 60
puts "#"
puts "#  Name:         #{name}"
puts "#  Date:         #{date}"
puts "#  Assignment:   #{assignment}"
puts "#  Class:        #{class_number}"
puts "#  Description:  #{description}"
puts "#"
puts "#" * 60
