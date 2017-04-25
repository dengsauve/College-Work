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
#                will change accordingly. 66 lines total
#
############################################################
$debug, $slow, maze_choice = true, true, 0
def print_menu
  Dir.glob('*.mz').sort.each_with_index{|f,i|puts"#{(i+1).to_s.rjust(2)} - #{f}#{"\n"+(i+2).to_s.rjust(2)+' - exit'if i==Dir.glob('*.mz').size-1}"}
end
def read_maze(index, maze=[]) # 1.	Read the maze into memory into some structure for processing – DOUBLE ARRAY
  File.open(Dir.glob('*.mz').sort[index]).each { |line| maze << line.tr("\n", '').split('') }
  print_maze(maze)
  maze
end
def print_maze(maze) # 2.	Print out the maze before it is solved
  $debug ? maze.each { |row| row.each { |col| print col.to_s.ljust(3)};puts} : maze.each { |row| row.each { |col| print col.to_s};puts}
end
def pathfinder(maze, counter=0, unexplored_territory=true, starting_cell=[])
  while counter==0
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == 'F' # Looking for the first starter cell
          [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south
            maze[row+mod[0]][col+mod[1]] = counter if maze[row+mod[0]][col+mod[1]] == ' '
          end end end end
    counter+=1 end
  print_maze(maze).inspect if $debug
  no_solution = false
  while unexplored_territory
    dig_dug = true
    maze.each_with_index do |array, row|
      array.each_with_index do |cell, col|
        if cell == (counter-1) # mapping out the maze, one by one
          [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south
            if maze[row+mod[0]][col+mod[1]] == 'S'
              unexplored_territory, starting_cell, dig_dug = false, [row, col], false
            elsif maze[row+mod[0]][col+mod[1]] == ' '
              maze[row+mod[0]][col+mod[1]], dig_dug = counter, false
            end end end end end
      unexplored_territory, no_solution = false, true if dig_dug # check for progress, no solutions found if true
    counter+=1
    if $debug
      system('clear') or system('cls')
      print_maze(maze)
      sleep(1.0/4.0) if $slow
    end end
  counter = counter - 3
  return [['No Solution']] if no_solution # 5.	IF there is no solution, then print an appropriate message and re-display the menu
  unless no_solution
    while counter >= 0
      maze[starting_cell[0]][starting_cell[1]] = '*'
      [[0,1],[-1,0],[0,-1],[1,0]].each do |mod|# east, north, west, south
        starting_cell = [starting_cell[0]+mod[0],starting_cell[1]+mod[1]] if maze[starting_cell[0]+mod[0]][starting_cell[1]+mod[1]].is_a?(Integer) && maze[starting_cell[0]+mod[0]][starting_cell[1]+mod[1]] == counter
        end
      counter -= 1 end
    maze[starting_cell[0]][starting_cell[1]] = '*'
    maze.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if col.is_a?(Integer)
          maze[r][c] = ' '
        end end end
    maze end end
while maze_choice != Dir.glob('*.mz').size
  print_menu
  maze_choice = gets.chomp.to_i-1
  if maze_choice >=0 && maze_choice < Dir.glob('*.mz').size
    print_maze(pathfinder(read_maze(maze_choice)))
  elsif maze_choice == Dir.glob('*.mz').size
  else
    puts "\nPlease enter a valid choice\n\n"
  end end
