# Kingdom, Phylum, Class, Order, Family, Genus, Species
class Animal
  attr_accessor :color, :name
  def initialize(color, name)
    @color = color
    @name = name
  end
  def to_s
    "My name is #{@name} and I am #{@color}"
  end
end

#buffalo = Animal.new('Brown', 'Buffy')

#puts buffalo.to_s

class Bird < Animal
  def initialize(color, name, num_wings)
    super(color, name)
    @num_wings = num_wings
  end

  def to_s
    "#{super} and I have #{@num_wings} wings!"
  end
end

eagle = Bird.new("Blue", "Sam", 2)

puts eagle