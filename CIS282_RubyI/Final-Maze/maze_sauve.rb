############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/25/17
#  Assignment:   Final Maze
#  Class:        CIS 282
#  Description:  A maze solving program.
#
############################################################
$debug = true
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
  maze.each { |row| row.each { |col| print col.to_s.ljust(2)};puts}
end

# 3.	Solve the maze by printing a character "path" from the beginning to the end which is specified by S (start) and F (finish).

def pathfinder(maze, counter=0, unexplored_territory=true, starting_cell=[])
  while counter==0
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == 'F'
          #east
          if maze[row][col+1] == ' '
            maze[row][col+1] = counter
          end
          #north
          if maze[row-1][col] == ' '
            maze[row-1][col] = counter
          end
          #west
          if maze[row][col-1] == ' '
            maze[row][col-1] = counter
          end
          #south
          if maze[row+1][col] == ' '
            maze[row+1][col] = counter
          end
        end
      end
    end
    counter+=1
  end
  print_maze(maze) if $debug
  while unexplored_territory
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == (counter-1)
          #east
          if maze[row][col+1] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row][col+1] == ' '
              maze[row][col+1] = counter
          end
          #north
          if maze[row-1][col] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row-1][col] == ' '
              maze[row-1][col] = counter
          end
          #west
          if maze[row][col-1] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row][col-1] == ' '
              maze[row][col-1] = counter
          end
          #south
          if maze[row+1][col] == 'S'
            unexplored_territory = false
            starting_cell = [row, col]
          elsif maze[row+1][col] == ' '
              maze[row+1][col] = counter
          end
        end
      end
    end
    counter+=1
    if $debug
      print_maze(maze)
      gets
    end
  end
  counter = counter - 3
  print counter
  while counter >= 0
    maze[starting_cell[0]][starting_cell[1]] = '*'
    if maze[starting_cell[0]][starting_cell[1]+1].is_a?(Integer)#east
      if maze[starting_cell[0]][starting_cell[1]+1].to_i == counter
        starting_cell = [starting_cell[0],starting_cell[1]+1]
      end
    elsif maze[starting_cell[0]-1][starting_cell[1]].is_a?(Integer)#north
      if maze[starting_cell[0]-1][starting_cell[1]].to_i == counter
        starting_cell = [starting_cell[0]-1,starting_cell[1]]
      end
    elsif maze[starting_cell[0]][starting_cell[1]-1].is_a?(Integer)#west
      if maze[starting_cell[0]][starting_cell[1]-1].to_i == counter
        starting_cell = [starting_cell[0],starting_cell[1]-1]
      end
    elsif maze[starting_cell[0]+1][starting_cell[1]].is_a?(Integer)#south
      if maze[starting_cell[0]+1][starting_cell[1]].to_i == counter
        starting_cell = [starting_cell[0]+1,starting_cell[1]]
      end
    end
    counter -= 1
  end
  maze
end






# 4.	Print the final maze with the path shown



# 5.	IF there is no solution, then print an appropriate message and re-display the menu



# There are 10 mazes provided called "maze1.mz" through "maze10.mz" which you can use to test your solution.
# Your main program should show a menu to the user to allow them to select a particular maze to solve.

# A short description of the algorithm as well as the mazes are provided in an attachment here.


# print_menu
maze = read_maze(0)
# puts maze.inspect
print_maze(maze)
maze = pathfinder(maze)
print_maze(maze)











