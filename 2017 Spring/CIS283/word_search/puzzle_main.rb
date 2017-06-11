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
require 'prawn'
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

def random_index(l)
  return rand(l)
end

def make_find_list(word_list)
  ret_str = ''
  word_list.sort.each_with_index do |word, index|
    ret_str += word.ljust(25)
    ret_str += "\n" if (index + 1) % 3 == 0
  end
  return ret_str
end

# Read the list of words and then sort them by the length of each word from largest to smallest
word_list = File.read('lib/words.txt').split("\r\n").sort_by { |a| a.length }.reverse.map(&:upcase)
word_list.each { |word| word.gsub!(' ', '')}
letter_list = word_list.join('').chars.to_a.uniq * 45

# Select a random row/col to start your placement of the word.
word_search = Puzzle.new

# Choose a random “direction” to begin placement.
# Start test-placing letters into the cells in the correct direction.
word_list.each do |word|
  success = false
  until success
    success = try_place(word, word_search)
  end
end

puts word_search.to_s

puzzle_key = word_search.to_print

puts word_search.to_s
letter_list.shuffle!
word_search.main_grid.each_with_index do |row, rindex|
  letter_list.shuffle!
  row.each_with_index do |col, cindex|
    letter = letter_list[cindex]
    word_search.main_grid[rindex][cindex] = letter if col == '.'
  end
end
puts word_search.to_s

Prawn::Document.generate( 'puzzle.pdf' ) do
  font "Courier", :size => 24
  text "Word Search Puzzle", :align => :center
  font "Courier", :size => 10
  text "#{word_search.to_print}", :align => :center
  font "Courier", :size => 16
  text "Find These #{word_list.length} Words!", :align => :center
  font "Courier", :size => 10
  text "#{make_find_list(word_list)}", :align => :center

  start_new_page

  font "Courier", :size => 24
  text "Word Search Key", :align => :center
  font "Courier", :size => 10
  text "#{puzzle_key}", :align => :center
  font "Courier", :size => 16
  text "Find These #{word_list.length} Words!", :align => :center
  font "Courier", :size => 10
  text "#{make_find_list(word_list)}", :align => :center
end

