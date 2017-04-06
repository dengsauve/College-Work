if maze[row][col+1] == 'S'# east
  unexplored_territory, starting_cell, dig_dug = false, [row, col], false
elsif maze[row][col+1] == ' '
  maze[row][col+1], dig_dug = counter, false
end
if maze[row-1][col] == 'S'# north
  unexplored_territory, starting_cell, dig_dug = false, [row, col], false
elsif maze[row-1][col] == ' '
  maze[row-1][col], dig_dug = counter, false
end
if maze[row][col-1] == 'S'# west
  unexplored_territory, starting_cell, dig_dug = false, [row, col], false
elsif maze[row][col-1] == ' '
  maze[row][col-1], dig_dug = counter ,false
end
if maze[row+1][col] == 'S'# south
  unexplored_territory, starting_cell, dig_dug = false, [row, col], false
elsif maze[row+1][col] == ' '
  maze[row+1][col], dig_dug = counter, false
end