############################################################
#
#  Name:         Dennis Sauve
#  Date:         03/02/17
#  Assignment:   Reverse Digits Extra Credit
#  Class:        CIS 282
#  Description:  Recursively reverses numbers.
#
############################################################
def reverse_places(number) print number % 10; reverse_places(number/10) if number/10 != 0 end