=begin

Properties
  contains pop
  coin slot
  power
  selection buttons
  temperature sensor / display
  distribute pop
  money

Actions
  select pop
  add money
  get change
  get the pop
  look at the temperature
  turn on / off

=end

class PopMachine
  attr_accessor :power, :money, :selection, :temperature
  def initialize
    @power = "off"
    @money = 0.0
    @selection = ""
    @temperature = 0.0
    @pops = [] # What is a pop - flavor, sugar_free, caffeine_free, oz, cost
  end

  def add_pop(pop)
    @pops << pop
  end

  def display_contents
    ret_str = ""
    @pops.each do |pop|
      ret_str += pop.display + "\n"
    end
    return ret_str
  end
end