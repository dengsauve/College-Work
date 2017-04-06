############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/01/17
#  Assignment:   Week Five Strength Exercise
#  Class:        CIS282 Ruby I
#  Description:  Program Deaf Grandma from the Book - 7.5
#
############################################################
farewell = 0

while farewell < 3
  print 'Speak to Grandma: '
  phrase = gets.chomp
  if phrase == phrase.upcase and phrase != '' and phrase != 'BYE'
    farewell = 0
    puts "NO, NOT SINCE #{rand(1930..1950)}!"
  elsif phrase == 'BYE'
    farewell += 1
  else
    farewell = 0
    puts 'HUH?! SPEAK UP, SONNY!'
    end
end