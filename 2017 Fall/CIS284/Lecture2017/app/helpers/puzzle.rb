# Puzzle code goes here

class Puzzle < Prawn::Document

  def initialize( puzzle_name, words )
    super()

    font "Courier", :size => 24
    text puzzle_name, :align => :center
    font "Courier", :size => 10

    word_list = words.split("\n").collect{ |w| w.gsub("\r", '')}

    word_list.each{ |word| text word }

    # generate_key
    # generate_puzzle
    # print_puzzle
    # new page
    # print_key
  end

end