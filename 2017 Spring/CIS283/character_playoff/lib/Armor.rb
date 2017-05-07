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
  attr_reader :protection_hits
  def initialize(name, protection_hits)
    super(name)
    @protection_hits = protection_hits
  end

  def to_s
    "#{@name} provides #{@protection_hits} points of protection"
  end
end