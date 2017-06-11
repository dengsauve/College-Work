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

def check(x, y)
  return x >= 0 && x < 45 && y >= 0 && y < 45
end

# Create a method for getting a new start position.
def get_start
  return [Random.rand(45), Random.rand(45)]
end

# Method for getting a random direction
def get_direction # most guys hate asking for directions...
  ret_array = [0, 0]
  while ret_array == [0, 0]
    ret_array = [Random.rand(-1..1), Random.rand(-1..1)]
  end
  return ret_array
end

# Method to try and place word
def try_place(word, word_search)
  y, x = get_start
  lambda_y, lambda_x = get_direction
  puzzle, start_locations = word_search.get_grid, word_search.status_grid
  word.split('').each do |letter|
    puts letter
    if check(x, y) && (puzzle[y][x] == '.' || puzzle[y][x] == letter)
      puzzle[y][x] = letter
      y, x = y + lambda_y, x + lambda_x
    else
      return false
    end
  end
  word_search.main_grid=(puzzle)
  return true
end

# Read the list of words and then sort them by the length of each word from largest to smallest
word_list = File.read('lib/words.txt').split("\r\n").sort_by { |a| a.length }.reverse
# puts word_list.inspect
word = word_list[0]

# Select a random row/col to start your placement of the word.
word_search = Puzzle.new

# Choose a random “direction” to begin placement.
# Start test-placing letters into the cells in the correct direction.
puts word_search.to_s

success = false
until success
  success = try_place(word, word_search)
end

puts word_search.to_s