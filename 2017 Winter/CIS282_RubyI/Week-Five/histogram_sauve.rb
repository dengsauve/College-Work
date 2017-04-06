############################################################
#
#  Name:         Dennis Sauve
#  Date:         01/30/17
#  Assignment:   Histogram
#  Class:        CIS282
#  Description:  Histogram Assignment
#
############################################################

((histogram = [0,0,0,0,0,0,0,0,0,0]).tap {(Array.new(200) {rand(1..100)}).each {|i| histogram[(i-1)/10] += 1}}).each_with_index {|i, index| puts "#{puts 'Range'.ljust(7) + "\#Found".center(12) + 'Chart'.ljust(20) + "\n" + '-----'.ljust(7) + '------'.center(12) + '-----'.ljust(20) if index==0}#{10*index+1}".ljust(2) + " - #{10*index+10}".ljust(6) + "| #{i.to_s} |".rjust(8) + "   #{'*' * i}"}