############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Character Class
#                [...]Maximum values should be class variables and should  be checked on input
#                [X]Attributes:
#                    [X]Name,
#                    [X]Race,
#                    [X]Hit Points (Max 100),
#                    [X]Current hit points (calculated)
#                    [X]Strength (Max 50),
#                    [X]Agility (Max 10),
#                    [X]Weapon,   (object from the Weapon Class)
#                    [X]Armor  (object from the Armor Class)
#                Methods:
#                    [X]to_s – to print out details about the character
#                    [X]current_status   - print out the current status of this character
#                    [X]revive_character – resets character's current_hits to original hits
#                    [X]reduce_hits   (removes some # of hits from the character)
#
############################################################

class Character

  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    hit_points < 101 ? @hit_points = hit_points : @hit_points = 100
    @current_hit_points = hit_points
    strength < 51 ? @strength = strength : @strength = 50
    @agility = agility
    @weapon = weapon
    @armor = armor
  end

  def to_s
    "#{@name} the #{@race}, has #{weapon} equipped, wearing #{armor}"
  end

  def current_status
    "#{@name} has #{@current_hit_points} left out of #{@hit_points}."
  end

  def revive_character
    @current_hit_points = @hit_points
  end

  def reduce_hits(points)
    @current_hit_points - points < 0 ? @current_hit_points -= points : @current_hit_points = 0
  end

end