############################################################
#
#  Name:         Dennis Sauve
#  Date:         06/13/17
#  Assignment:   Word Puzzle Generator - Final
#  Class:        CIS282
#  Description:  A program that takes a word list and generates a wordsearch puzzle.
#
############################################################

class Puzzle
  attr_accessor :main_grid
  attr_reader :status_grid
  def initialize
    @main_grid = Array.new(45, Array.new(45, ''))
    @status_grid = Array.new(45, Array.new(45, :open))
  end
end