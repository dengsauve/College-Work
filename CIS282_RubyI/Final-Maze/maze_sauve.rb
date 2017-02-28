############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/25/17
#  Assignment:   Final Maze
#  Class:        CIS 282
#  Description:  A maze solving program.
#
############################################################
$debug = false

def print_menu
  Dir.glob('*.mz').each_with_index{|f,i|puts"#{(i+1).to_s.rjust(2)} - #{f}#{"\n"+(i+2).to_s.rjust(2)+' - exit'if i==Dir.glob('*.mz').size-1}"}
end

# 1.	Read the maze into memory into some structure for processing – DOUBLE ARRAY

def read_maze(index, maze=[])
  File.open(Dir.glob('*.mz')[index]).each { |line| maze << line.strip.split('') }
  maze
end

# 2.	Print out the maze before it is solved
def print_maze(maze)
  maze.each { |row| row.each { |col| print col.to_s.ljust(3)};puts}
end

# 3.	Solve the maze by printing a character "path" from the beginning to the end which is specified by S (start) and F (finish).
def pathfinder(maze, counter=0, unexplored_territory=true, starting_cell=[])
  while counter==0
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == 'F'
          maze[row][col+1] = counter if maze[row][col+1] == ' '#east
          maze[row-1][col] = counter if maze[row-1][col] == ' '#north
          maze[row][col-1] = counter if maze[row][col-1] == ' '#west
          maze[row+1][col] = counter if maze[row+1][col] == ' '#south
        end end end
    counter+=1
  end
  print_maze(maze) if $debug
  no_solution = false
  while unexplored_territory
    dig_dug = true
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == (counter-1)
          #east
          if maze[row][col+1] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row][col+1] == ' '
              maze[row][col+1] = counter
              dig_dug = false
          end
          #north
          if maze[row-1][col] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row-1][col] == ' '
              maze[row-1][col] = counter
              dig_dug = false
          end
          #west
          if maze[row][col-1] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row][col-1] == ' '
              maze[row][col-1] = counter
              dig_dug = false
          end
          #south
          if maze[row+1][col] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row+1][col] == ' '
              maze[row+1][col] = counter
              dig_dug = false
          end end end end
    if dig_dug
      unexplored_territory = false
      no_solution = true
    end
    counter+=1
    if $debug
      print_maze(maze)
      sleep(1.0/5.0)
    end
  end
  counter = counter - 3
  counter
  if no_solution
    [['No Solution']]
  else
    while counter >= 0
      maze[starting_cell[0]][starting_cell[1]] = '*'
      if maze[starting_cell[0]][starting_cell[1]+1].is_a?(Integer) && maze[starting_cell[0]][starting_cell[1]+1] == counter #east
          starting_cell = [starting_cell[0],starting_cell[1]+1]
      end
      if maze[starting_cell[0]-1][starting_cell[1]].is_a?(Integer) && maze[starting_cell[0]-1][starting_cell[1]] == counter#north
        starting_cell = [starting_cell[0]-1,starting_cell[1]]
      end
      if maze[starting_cell[0]][starting_cell[1]-1].is_a?(Integer) && maze[starting_cell[0]][starting_cell[1]-1] == counter#west
        starting_cell = [starting_cell[0],starting_cell[1]-1]
      end
      if maze[starting_cell[0]+1][starting_cell[1]].is_a?(Integer) && maze[starting_cell[0]+1][starting_cell[1]] == counter#south
        starting_cell = [starting_cell[0]+1,starting_cell[1]]
      end
      counter -= 1
    end
    maze[starting_cell[0]][starting_cell[1]] = '*'
    maze.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if col.is_a?(Integer)
          maze[r][c] = ' '
        end
      end
    end
    maze
  end
end






# 4.	Print the final maze with the path shown



# 5.	IF there is no solution, then print an appropriate message and re-display the menu



# There are 10 mazes provided called "maze1.mz" through "maze10.mz" which you can use to test your solution.
# Your main program should show a menu to the user to allow them to select a particular maze to solve.

# A short description of the algorithm as well as the mazes are provided in an attachment here.


print_menu
maze = read_maze(0)
print_maze(maze)
maze = pathfinder(maze)
print_maze(maze)


