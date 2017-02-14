############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/14/17
#  Assignment:   Hash Assignment
#  Class:        CIS282
#  Description:  Assignment to create an inventory control
#                system for a retail business
#
############################################################

menu = 'Inventory Control System

  1. View all Products
  2. Add a Product
  3. Remove a Product
  4. Update a Product
  5. View Highest Priced Product
  6. View Lowest Priced Product
  7. View Sum of all Product Prices

  8. Exit
'

def view_products (inventory)
  puts "\n"+'Item'.ljust(6) + 'Description'.ljust(30) + 'Price'.rjust(9)
  puts '----'.ljust(6) + ('-'*28).ljust(30) + '---------'.ljust(9)
  inventory.each { |i| puts i[0].to_s.ljust(6) + i[1][0].ljust(30) + '$' + (i[1][1].to_s).rjust(8)}
  puts
end

def add_product (inventory)
  puts "\nNew Product Entry\n\n"
  new_num = rand(100..999)
  while inventory.has_key?(new_num)
    new_num = rand(100..999)
  end
  print 'Product Description: '
  product = gets.chomp
  print 'Product Price: $'
  price = gets.chomp.to_f
  puts new_num.to_s + ' ' + product + ' ' + price.to_s
end

def remove_product (inventory)

end

def update_product (inventory)

end

def highest_priced (inventory)

end

def lowest_priced (inventory)

end

def product_sum (inventory)

end

def startup
  f = File.open('product.txt')
  product_data = f.readlines.each {|line| line.chomp!}
  f.close

  inventory = {}
  product_data.each { |i| inventory[i.split(',')[0].to_i] = [i.split(',')[1], i.split(',')[2].to_f] }
  inventory
end

inventory, choice = startup, ''
puts inventory

while choice != '8'
  puts menu
  print "\nPlease enter a choice:"
  choice = gets.chomp
  case choice
    when '1'
      view_products(inventory)
    when '2'
      add_product(inventory)
    when '3'
      remove_product(inventory)
    when '4'
      update_product(inventory)
    when '5'
      highest_priced(inventory)
    when '6'
      lowest_priced(inventory)
    when '7'
      product_sum(inventory)
    when '8'
    else
      puts "\nPlease enter a valid choice.\n"
  end
end
