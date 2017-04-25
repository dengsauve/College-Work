############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/25/17
#  Assignment:   Final Maze
#  Class:        CIS 282
#  Description:  A maze solving program with Dynamic Menu
#                meaning you can move a new .mz file into
#                the working directory, and after solving
#                another puzzle or refreshing, the new
#                item will show up and the exit option
#                will change accordingly.
#
#                66 lines at minimum (see maze_sauve.rb)
#
############################################################

# setting the global variables and initializing the menu_choice variable
$debug, $slow, maze_choice = false, false, 0


# Method to print a simple menu (number + file) with the last option being to exit the program
def print_menu
  Dir.glob('*.mz').sort.each_with_index{|f,i|puts"#{(i+1).to_s.rjust(2)} - #{f}#{"\n"+(i+2).to_s.rjust(2)+' - exit'if i==Dir.glob('*.mz').size-1}"}
end


# Method to read the .mz file into a double array, it was necessary to use tr() instead of strip because of blank spaces w/no walls maps
def read_maze(index, maze=[])
  File.open(Dir.glob('*.mz').sort[index]).each { |line| maze << line.tr("\n", '').split('') }
  print_maze(maze)
  maze
end


# Method to print out the maze from a double array. Format depends on debug boolean.
def print_maze(maze)
  $debug ? maze.each { |row| row.each { |col| print col.to_s.ljust(3)};puts} : maze.each { |row| row.each { |col| print col.to_s};puts}
end


# Method to map the path from Finish to Start, and then clear all numbers, leaving only the *s on the map
def pathfinder(maze, counter=0, unexplored_territory=true, starting_cell=[])

  # This while loop goes over the maze once, looking for a 'F' in a cell (maze[row][col]), and adding 0 to ENWS if possible
  while counter==0
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == 'F' # Looking for the first starter cell
          [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south checked one at a time
            maze[row+mod[0]][col+mod[1]] = counter if maze[row+mod[0]][col+mod[1]] == ' '
          end
        end
      end
    end
    counter+=1
  end

  print_maze(maze).inspect if $debug
  no_solution = false


  # This while loop goes through and looks for either blank spaces adjacent to numbers, or 'S' in a cell.
  while unexplored_territory
    dig_dug = true
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == (counter-1) # mapping out the maze, one by one
          [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south checked one at a time
            if maze[row+mod[0]][col+mod[1]] == 'S'
              unexplored_territory, starting_cell, dig_dug = false, [row, col], false
            elsif maze[row+mod[0]][col+mod[1]] == ' '
              maze[row+mod[0]][col+mod[1]], dig_dug = counter, false
            end
          end
        end
      end
    end
      unexplored_territory, no_solution = false, true if dig_dug # check for progress, no solutions found if true
    counter+=1
    if $debug
      system('clear') or system('cls')
      print_maze(maze)
      sleep(1.0/4.0) if $slow
    end
  end

  counter = counter - 3 # Getting the counter ready for reverse mapping
  return [['No Solution']] if no_solution # 5.	IF there is no solution, then print an appropriate message and re-display the menu
  unless no_solution


    # This while loop goes and looks for the route back following descending numbers.
    while counter >= 0
      maze[starting_cell[0]][starting_cell[1]] = '*'
      [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south checked one at a time
        if maze[starting_cell[0]+mod[0]][starting_cell[1]+mod[1]].is_a?(Integer) && maze[starting_cell[0]+mod[0]][starting_cell[1]+mod[1]] == counter
          starting_cell = [starting_cell[0]+mod[0],starting_cell[1]+mod[1]]
        end
      end
      counter -= 1
    end

    maze[starting_cell[0]][starting_cell[1]] = '*' # Sets the last cell to *


    # This set of loops goes through and clears out integers from the maze
    maze.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if col.is_a?(Integer)
          maze[r][c] = ' '
        end
      end
    end

    # Return the finished product
    maze
  end
end


# This is the while loop that controls what the program does based on user input
while maze_choice != Dir.glob('*.mz').size
  print_menu
  maze_choice = gets.chomp.to_i-1
  if maze_choice >=0 && maze_choice < Dir.glob('*.mz').size
    print_maze(pathfinder(read_maze(maze_choice)))
  elsif maze_choice == Dir.glob('*.mz').size
  else
    puts "\nPlease enter a valid choice\n\n"
  end
end