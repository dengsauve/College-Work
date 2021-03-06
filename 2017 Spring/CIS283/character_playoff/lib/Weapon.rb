############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Weapon Class - Inherits from Item Class
#                [X]Attributes:
#                  [X]damage_hits
#                [...]Methods:
#                  [...]to_s
#
############################################################

class Weapon < Item
  attr_reader :damage_hits
  def initialize(name, damage_hits)
    super(name)
    @damage_hits = damage_hits
  end

  def to_s
    return "#{@name} that does #{@damage_hits} points of damage"
  end
end