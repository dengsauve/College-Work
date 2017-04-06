############################################################
#
#  Name:         Dennis Sauve
#  Date:         03/02/17
#  Assignment:   Coin Extra Credit
#  Class:        CIS 282
#  Description:  Coin Counter that sums the values of the coins given
#
############################################################
print 'Please Enter the number of Quarters: '
quarters = gets.chomp.to_i
print 'Please enter the number of dimes: '
dimes = gets.chomp.to_i
print 'Please enter the number of nickels: '
nickels = gets.chomp.to_i
print 'Please enter the number of pennies: '
pennies = gets.chomp.to_i
sum = (quarters*0.25)+(dimes*0.1)+(nickels*0.05)+(pennies*0.01)
puts "You have #{quarters} quarters, #{dimes} dimes, #{nickels} nickels, and #{pennies} pennies for a total of $#{sprintf '%.2f', sum}"