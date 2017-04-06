############################################################
#
#  Name:         Dennis Sauve
#  Date:         03/02/17
#  Assignment:   Acronym Extra Credit
#  Class:        CIS 282
#  Description:  Returns uppercase first letter of every word
#
############################################################
def acronym(phrase, return_acronym='') phrase.split().each { |word| return_acronym += word[0].upcase}; return_acronym end