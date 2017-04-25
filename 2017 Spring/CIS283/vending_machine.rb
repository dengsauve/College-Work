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

class VendingMachine
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
    ret_str
  end

  def display_selections
    ret_str = ""
    @pops.each_with_index do |item, index|
      ret_str += "#{index + 1}. #{item.flavor}\n"
    end
    ret_str
  end

  def get_tabbed_data
    ret_str = ""
    @pops.each do |item|
      ret_str += item.to_tab+"\n"
    end
    ret_str
  end

  def get_item(item_number)
    return @pops[item_number-1]
  end
end