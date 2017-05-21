=begin

Do all the user interface, menu, getting money from user, displaying the pops

=end

require_relative 'vending_machine'
require_relative 'pop'
pop_machine = VendingMachine.new

root_beer = Pop.new('Root Beer', true, true, 12, 1.50)
orange = Pop.new('Orange Zap', false, true, 12, 1.50)
diet_pepsi = Pop.new('Diet Pepsi', true, false, 12, 1.5)
pepsi = Pop.new('Pepsi', false, false, 12, 1.5)
jones_soda_apple = Pop.new('Jones Soda: Green Apple', false, true, 12, 2.0)

pop_machine.add_pop(root_beer)
pop_machine.add_pop(orange)
pop_machine.add_pop(diet_pepsi)
pop_machine.add_pop(pepsi)
pop_machine.add_pop(jones_soda_apple)

puts pop_machine.inspect

puts pop_machine.display_contents

puts pop_machine.get_tabbed_data

puts pop_machine.display_selections
print 'Enter your pop selection: '
user_selection = gets.chomp.to_i
puts pop_machine.get_item(user_selection)



=begin
Save all items to disk
  open file save_data = File.open("list.txt", "w")
  save_data.puts pop_machine.get_tabbed_data
  get all the items in the pop_machine
  in a format suitable for writing to disk
  pop_machine.get_tabbed_data # Return a string of all the data in the pop_machine
=end

