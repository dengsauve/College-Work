print "What is your first name?: "
first_name = gets.chomp
print "What is your middle name?: "
middle_name = gets.chomp
print "What is your last name?: "
last_name = gets.chomp

puts "Greetings, #{first_name} #{middle_name} #{last_name}"

print "What is your favorite number?: "
favorite_number = gets.chomp
puts "I suggest that you make #{favorite_number.to_i + 1} your new favorite number."
