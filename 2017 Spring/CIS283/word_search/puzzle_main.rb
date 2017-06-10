############################################################
#
#  Name:         Dennis Sauve
#  Date:         06/13/17
#  Assignment:   Word Puzzle Generator - Final
#  Class:        CIS282
#  Description:  A program that takes a word list and generates a wordsearch puzzle.
#
############################################################
require_relative('lib/puzzle')

# Read the list of words and then sort them by the length of each word from largest to smallest
word_list = File.read('lib/words.txt').split("\r\n").sort_by { |a| a.length }.reverse
puts word_list.inspect
word = word_list[0]

# Select a random row/col to start your placement of the word.
word_search = Puzzle.new
start = [Random.rand(45), Random.rand(45)]

# Choose a random “direction” to begin placement.
# Start test-placing letters into the cells in the correct direction.
data = [word, word_search, start]
case Random.rand(8)
  when 0
    try_east(data)
  when 1
    north_east(data)
  when 2
    north(data)
  when 3
    north_west(data)
  when 4
    west(data)
  when 5
    south_west(data)
  when 6
    south(data)
  when 7
    south_east(data)
end