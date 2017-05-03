############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Item Class
#                Attributes
#                  [ ]Name
#
############################################################

class Item
  attr_reader :name
  def initialize(name)
    @name = name
  end
end