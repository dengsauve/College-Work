class Pop

  attr_accessor :flavor, :sugar_free, :caffeine_free, :oz, :cost
  def initialize(flavor, sugar_free, caffeine_free, oz, cost)
    @flavor = flavor
    @sugar_free = sugar_free
    @caffeine_free = caffeine_free
    @oz = oz
    @cost = cost
  end

  def display
    "#{@flavor}(#{@sugar_free ? 'sugar free, ' : 'contains sugar, '}#{@caffeine_free ? 'caffeine free' : 'caffeinated'}), #{@oz} ounces, $#{@cost}"
  end

  def to_s
    "#{@flavor}(#{@sugar_free ? 'sugar free, ' : 'contains sugar, '}#{@caffeine_free ? 'caffeine free' : 'caffeinated'}), #{@oz} ounces, $#{@cost}"
  end

  def to_tab
    "#{@flavor}\t#{@sugar_free}\t#{@caffeine_free}\t#{@oz}\t#{@cost}"
  end
end