############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/16/17
#  Assignment:   Ruby Classes
#  Class:        CIS283
#  Description:  A Program that implements ruby classes to
#                store object information.
#
############################################################

class Person
  def initialize(first_name, last_name, age, hair_color, eye_color)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end

  def get_first_name() @first_name end
  def get_last_name() @last_name end
  def get_age() @age end
  def get_hair_color() @hair_color end
  def get_eye_color() @eye_color end

  def set_first_name(first_name) @first_name = first_name end
  def set_last_name(last_name) @last_name = last_name end
  def set_age(age) @age = age end
  def set_hair_color(hair_color) @hair_color = hair_color end
  def set_eye_color(eye_color) @eye_color = eye_color end

  def to_s
    "Name: #{@first_name} #{@last_name}, Age: #{@age.to_s}, Hair Color: #{@hair_color}, Eye Color: #{@eye_color}"
  end
end

class Address
  def initialize(line1, line2=nil, city, state, zip)
    @line1 = line1
    @line2 = line2
    @city = city
    @state = state
    @zip = zip
  end

  def get_line1() @line1 end
  def get_line2() @line2 end
  def get_city() @city end
  def get_state() @state end
  def get_zip() @zip end

  def set_line1(line1) @line1 = line1 end
  def set_line2(line2) @line2 = line2 end
  def set_city(city) @city = city end
  def set_state(state) @state = state end
  def set_zip(zip) @zip = zip end

  def to_s
    "#{@line1}#{"\n#{@line2}" if @line2}\n#{@city}, #{@state} #{@zip.to_s}"
  end
end

class Character
  def initialize(name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @weapons = []
    @gold = gold
    @clothing = []
  end

  def get_name() @name end
  def get_race() @race end
  def get_hit_points() @hit_points end
  def get_weapons() @weapons end
  def get_gold() @gold end
  def get_clothing() @clothing end

  def set_name(name) @name = name end
  def set_race(race) @race = race end
  def set_hit_points(hit_points) @hit_points = hit_points end
  def set_gold(gold) @gold = gold end

  def add_weapon(weapon) @weapons << weapon end
  def add_clothing(clothing) @clothing << clothing end

  def drop_weapon(weapon)
    @weapons.delete_at(@weapons.index(weapon)) if @weapons.include?(weapon)
  end
  def drop_clothing(clothing)
    @clothing.delete_at(@clothing.index(clothing)) if @clothing.include?(clothing)
  end

  def to_s
    "Name: #{@name}\nRace: #{@race}\nHit Points: #{@hit_points}\nWeapons: #{@weapons.join(', ')}\nGold: #{@gold}\nClothing: #{@clothing.join(', ')}"
  end
end

#Person tests

adam = Person.new('Adam', 'Crowly', 24, 'brown', 'blue')
adam.set_first_name('AJ')
puts adam.get_first_name
adam.set_last_name('Crowley')
puts adam.get_last_name
adam.set_age(25)
puts adam.get_age
adam.set_hair_color('brown')
puts adam.get_hair_color
adam.set_eye_color('hazel')
puts adam.get_eye_color
puts '', adam.to_s, ''

#Address tests

home = Address.new('2312 S Davis Ct.', 'Spokane', 'WA', 99216)
home.set_line1('2313 S Davis Ct.')
puts home.get_line1
home.set_line2('Upstairs Room')
puts home.get_line2
home.set_city('Spokane Valley')
puts home.get_city
home.set_state('Washington')
puts home.get_state
home.set_zip(99226)
puts home.get_zip
puts '',home.to_s, ''

#Character tests

player_one = Character.new('Raistlin Majere: The Greatest Mage Ever', 'human', 5, 500)
player_one.set_name('Raistlin Majere')
puts player_one.get_name
player_one.set_race('civlized human')
puts player_one.get_race
player_one.set_hit_points(13)
puts player_one.get_hit_points
player_one.add_weapon('Spell Tome')
player_one.add_weapon('Dust')
player_one.add_weapon('Staff')
player_one.drop_weapon('Dust')
puts player_one.get_weapons
player_one.set_gold(1100)
puts player_one.get_gold
player_one.add_clothing('Robes')
player_one.add_clothing('Sandals')
player_one.add_clothing('Ring')
player_one.drop_clothing('Sandals')
puts player_one.get_clothing
puts '', player_one.to_s
