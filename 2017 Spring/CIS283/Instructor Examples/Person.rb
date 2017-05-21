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

class Child < Person
  def to_s
    return 'Young Adult'
  end
end

class GrandChild < Child
  def to_s
    return 'Still a baby, nothing to report'
  end
end


dave = Person.new('gray', 'green', 42, false)
puts dave.to_s

mini_dave = Child.new('gray', 'green', 23, false)
puts mini_dave.to_s

micro_dave = GrandChild.new('blonde', 'blue', 1, false)
puts micro_dave.to_s