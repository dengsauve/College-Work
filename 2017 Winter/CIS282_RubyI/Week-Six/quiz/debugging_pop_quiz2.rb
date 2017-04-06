# Dennis Sauve - Quiz 1
#
# Program to show the smallest number in an array
# Lets user view the array, add a new number and show smallest number in the array
# 
# INDENT and REFORMAT code as appropriate to MY standards ( DAVE STANDARD CODING - DSC ).
# Debug and fix the code so that it works correctly.
# Print out the final copy and turn it it with your name on it.
#

numbers = ["100","20","30","40","80"]

menu_selection = ""
while menu_selection != "4" do
  puts "1 Show All Numbers"
  puts "2 Add a Number"
	puts "3 Show Smallest Number"
	puts
	puts "4 Exit Program"
  menu_selection = gets.chomp
  if( menu_selection == "1" ) then numbers.each { | n | puts n }
  	print "Press enter to continue"
  	pause = gets
  elsif( menu_selection == "2" ) then puts "Enter a new number: "
		numbers[ numbers.length] = gets.chomp.to_i
	elsif( menu_selection == "3" ) then index = numbers[0].to_i
		numbers.each do |i|
      if i.to_i < index then index = i.to_i end
    end
		puts "Smallest number is: #{ index }"
		print "Press enter to continue"
		pause = gets
  end
end
