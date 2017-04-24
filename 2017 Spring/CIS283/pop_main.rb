=begin

Do all the user interface, menu, getting money from user, displaying the pops

=end

require_relative 'pop_machine'
require_relative 'pop'
vending_machine = PopMachine.new

root_beer = Pop.new('Root Beer', true, true, 12, 1.50)
orange = Pop.new('Orange Zap', false, true, 12, 1.50)

vending_machine.add_pop(root_beer)
vending_machine.add_pop(orange)

puts vending_machine.inspect

puts vending_machine.display_contents