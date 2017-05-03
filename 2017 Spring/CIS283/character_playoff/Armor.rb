############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        283
#  Description:  Armor Class - Inherits from Class Item
#                [X]Attributes:
#                  [X]protection_hits
#                [...]Methods:
#                  [...]to_s
#
############################################################

class Armor < Item
  def initialize(name, protection_hits)
    super
    @protection_hits = protection_hits
  end

  def to_s
    "#{name} provides #{@damage_hits} points of protection"
  end
end