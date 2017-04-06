############################################################
#
#  Name:         Dennis Sauve
#  Date:         01/20/2017
#  Assignment:   triangle - diamond
#  Class:        CIS282
#  Description:  This project had us create a right triangle and diamond based on user input for side length
#
############################################################
#Grab the side length from the user
print "How long are the sides?: "
side_length = gets.chomp.to_i

if side_length > 0
#The following code creates the basic right triangle
  puts "*"
  (side_length - 2).times do |i|
      print "*"
      print " " * i
      puts "*"
  end
  puts "*" * side_length
#The following code creates the number right triangle
  side_length.times do |i|
      (i + 1).times do |n|
          print (n + 1).to_s
      end
      puts
  end
#The following code creates the mirror right triangle
  print " " * (side_length - 1)
  puts "*"
  (side_length - 2).times do |i|
      print " " * (side_length - (i + 2))
      print "*"
      print " " * i
      puts "*"
  end
  puts "*" * side_length
#The following code creates the diamond
  line_length = (side_length * 2)
  puts "*".rjust(line_length / 2)
  (side_length - 1).times do |i|
      puts ("*"+(" " * ((i*2)+1))+"*").rjust((line_length/2)+i+1)
  end
  (side_length-3).downto(0) do |i|
      puts ("*"+(" " * ((i*2)+1))+"*").rjust((line_length/2)+i+1)
  end
  puts "*".rjust(line_length / 2)
else
  puts "Please enter an integer greater than 0."
end
