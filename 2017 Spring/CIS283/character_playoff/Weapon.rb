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
  def initialize(name, damage_hits)
    @name = name
    @damage_hits = damage_hits
  end

  def to_s
    "#{@name} does #{@damage_hits} points of damage"
  end
end