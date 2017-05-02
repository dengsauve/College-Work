class Person
  attr_accessor :hair_colr, :eye_color, :num_teeth, :bald
  def initialize(hair_color, eye_color, num_teeth, bald)
    @hair_color = hair_color
    @eye_color = eye_color
    @num_teeth = num_teeth
    @bald = bald
  end

  def to_s
    return "Hair color: #{@hair_color}"
  end

end


dave = Person.new('gray', 'green', 32, true)

puts dave.to_s