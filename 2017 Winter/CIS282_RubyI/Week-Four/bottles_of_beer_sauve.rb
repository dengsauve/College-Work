(1..99).each do |i|
  puts "#{(100-i).to_s} bottles of beer on the wall, #{(100-i).to_s} bottles of beer!
You take one down and pass it around, #{(99-i).to_s} bottles of beer on the wall!"
end
puts 'No more bottles of beer on the wall, no more bottles of beer.
Go to the store, and buy me some more! 99 bottles of beer on the wall!'
