############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Dice Class
#                [X]Attributes:
#                  [X]sides_of_die
#                [X]Methods:
#                  [X]initialize(  num_sides )
#                  [X]roll  (returns a random number between 1 and num_sides )
#
############################################################

class Dice
  def initialize(num_sides)
    @num_sides = num_sides
    @showing = 1 + rand(num_sides)
  end

  def roll
    @showing = 1 + rand(@num_sides)
  end

  def showing
    @showing
  end
end