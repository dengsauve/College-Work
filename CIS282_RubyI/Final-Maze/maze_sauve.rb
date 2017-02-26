############################################################
#
#  Name:         Dennis Sauve
#  Date:         02/25/17
#  Assignment:   Final Maze
#  Class:        CIS 282
#  Description:  A maze solving program.
#
############################################################

def print_menu
  Dir.glob('*.mz').each_with_index{|f,i|puts"#{(i+1).to_s.rjust(2)} - #{f}#{"\n"+(i+2).to_s.rjust(2)+' - exit'if i==Dir.glob('*.mz').size-1}"}
end



# 1.	Read the maze into memory into some structure for processing – DOUBLE ARRAY



# 2.	Print out the maze before it is solved



# 3.	Solve the maze by printing a character "path" from the beginning to the end which is specified by S (start) and F (finish).



# 4.	Print the final maze with the path shown



# 5.	IF there is no solution, then print an appropriate message and re-display the menu



# There are 10 mazes provided called "maze1.mz" through "maze10.mz" which you can use to test your solution.
# Your main program should show a menu to the user to allow them to select a particular maze to solve.

# A short description of the algorithm as well as the mazes are provided in an attachment here.


print_menu





















