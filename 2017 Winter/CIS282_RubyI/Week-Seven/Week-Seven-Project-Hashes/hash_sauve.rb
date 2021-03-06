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

menu = "\nInventory Control System\n
  #  Option
---  -------------------------------
  1. View all Products
  2. Add a Product
  3. Remove a Product
  4. Update a Product
  5. View Highest Priced Product
  6. View Lowest Priced Product
  7. View Sum of all Product Prices\n
  8. Save Changes and Exit
  9. Exit without Saving"

def view_products (inventory)
  puts "\n"+'Item'.ljust(6) + 'Description'.ljust(30) + 'Price'.rjust(9) +"\n"+'----'.ljust(6) + ('-'*28).ljust(30) +('-'*9).ljust(9)
  inventory.sort_by{ |k| k }.each{ |i| puts i[0].to_s.ljust(6) + i[1][0].ljust(30) + '$' + (i[1][1].to_s).rjust(8)}
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
  inventory[new_num] = [product, price]
  puts "\nNew Product Entered: "+new_num.to_s + ' ' + product + ' ' + price.to_s+"\n\n"
end

def remove_product (inventory)
  print "\nRemove Product by Item Number\nPlease enter an Item Number to remove: "
  item_number = gets.chomp.to_i
  if inventory.has_key?(item_number)
    inventory.delete(item_number)
    puts "\nThe item has been removed from inventory."
  else
    puts "\nThat item does not exist."
  end end

def update_product (inventory)
  print "\nPlease enter the item number to update: "
  item_number = gets.chomp.to_i
  if inventory.has_key?(item_number)
    print 'Please enter the new description: '
    description = gets.chomp
    print 'Please enter a new price: '
    price = gets.chomp.to_f
    inventory[item_number] = [description, price]
    print 'Item successfully updated!'
  else
    print'That item does not exist.'
  end end

def highest_priced (inventory)
  high_price, high_item = 0.0, 0
  inventory.each do |i|
    if i[1][1] > high_price
      high_price, high_item = i[1][1], i[0]
    end
  end
  puts "\nThe highest priced item is: " + inventory[high_item][0] + "\n\n"
end

def lowest_priced (inventory)
  lowest_price, lowest_item = nil, nil
  inventory.each do |i|
    if lowest_price
      if i[1][1] < lowest_price
        lowest_price, lowest_item = i[1][1], i[0]
      end
    else
      lowest_price, lowest_item = i[1][1], i[0]
    end end
  puts "\nThe lowest priced item is: " + inventory[lowest_item][0] + "\n\n"
end

def product_sum (inventory)
  sum = 0.0
  inventory.each do |i|
    sum += i[1][1]
  end
  puts "\n$"+sum.round(2).to_s+"\n\n"
end

def startup
  f = File.open('product.txt')
  product_data, inventory = f.readlines.each {|line| line.chomp!}, {}
  f.close
  product_data.each { |i| inventory[i.split(',')[0].to_i] = [i.split(',')[1], i.split(',')[2].to_f] }
  inventory
end

def shutdown (inventory)
  f, write_string = File.open('product.txt', 'w'), ''
  inventory.each do |i|
    write_string += (i[0].to_s+','+i[1][0].to_s+','+i[1][1].to_s+"\n")
  end
  f.write(write_string)
  f.close
end

inventory, choice = startup, ''

while choice != '8' and choice != '9'
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
      shutdown(inventory)
    when '9'
    else
      puts "\nPlease enter a valid choice.\n"
  end
end
