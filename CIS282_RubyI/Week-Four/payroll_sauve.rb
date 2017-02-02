############################################################
#
#  Name:         Dennis Sauve
#  Date:         01/12/17
#  Assignment:   Week 2 Project: Payroll
#  Class:        CIS 282
#  Description:  This project is to simulate a payroll system for a single employee at a time.
#
############################################################


print "Enter Employee's Name: "
employee_name = gets.chomp
print "Enter number of hours worked in a week: "
hours_worked = gets.chomp.to_i
print "Enter hourly pay rate: "
pay_rate = gets.chomp.to_i
print "Enter federal tax withholding rate: "
federal_tax = gets.chomp.to_f
print "Enter state tax withholding rate: "
state_tax = gets.chomp.to_f

gross_pay = (hours_worked * pay_rate).round(2)
federal_withholding = (gross_pay * federal_tax).round(2)
state_withholding = (gross_pay * state_tax).round(2)
total_deduction = (federal_withholding + state_withholding).round(2)
net_pay = gross_pay - total_deduction

puts "\nEmployee Name: #{employee_name}"
puts "Hours Worked: #{hours_worked}"
puts "Pay Rate: $#{pay_rate}/hour"
puts "Gross Pay: $#{gross_pay}"
puts "Deductions:"
puts "  Federal Withholding (#{(federal_tax * 100).round(2)}%): $#{federal_withholding}"
puts "  State Withholding (#{(state_tax * 100).round(2)}%): $#{state_withholding}"
puts "  Total Deduction:  $#{total_deduction}"
puts "Net Pay:  $#{net_pay}"
