############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/08/16
#  Assignment:   Week Six Strength Exercises
#  Class:        CIS 282
#  Description:  8.3 Strength Exercises: Building and Sorting an Array
#
############################################################
user_input, input_array = 'goes here', []
puts ('Type as many words as you want, press enter on an empty line to finish')
while user_input != '' do user_input = gets.chomp; input_array.push(user_input) end
input_array.sort.each { |word| puts word}