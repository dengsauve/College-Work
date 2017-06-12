############################################################
#
#  Name:         Dennis Sauve
#  Date:         06/13/17
#  Assignment:   Word Puzzle Generator - Final
#  Class:        CIS282
#  Description:  A program that takes a word list and
#                generates a word search puzzle.
#
############################################################

class Puzzle
  attr_accessor :main_grid
  def initialize
    @main_grid = Array.new(45) { Array.new(45, '.') }
  end

  def to_s # for output to console
    ret_str = ''
    @main_grid.each_with_index do | row, index |
      ret_str += (index.to_s + '.').ljust(4) + row.join('') + "\n"
    end
    return ret_str
  end

  def to_print # for output to PDF
    ret_str = ''
    @main_grid.each_with_index do | row, index |
      ret_str += row.join(' ') + "\n"
    end
    return ret_str
  end

  def get_grid # Created to get a non-pointer copy of puzzle grid
    return Marshal.load(Marshal.dump(@main_grid))
  end
end