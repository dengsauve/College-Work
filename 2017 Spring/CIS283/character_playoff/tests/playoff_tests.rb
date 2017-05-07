require_relative('lib/ib/Dice')

def test_dice(side)
  d_6 = Dice.new(side)

  10.times do
    d_6.roll
    puts d_6.showing
  end
end

test_dice(4)
puts "\n-\n\n"
test_dice(5)
puts "\n-\n\n"
test_dice(6)
puts "\n-\n\n"
test_dice(8)
puts "\n-\n\n"
test_dice(10)
puts "\n-\n\n"
test_dice(15)