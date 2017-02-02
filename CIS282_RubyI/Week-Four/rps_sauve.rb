############################################################
#
#  Name:         Dennis Sauve
#  Date:         01/25/17
#  Assignment:   Rock Paper Scissors (Lizard Spock)
#  Class:        CIS 282
#  Description:  The program will allow the user to play
#                against the computer or another human.
#
############################################################

assignments, basic_rules = Hash[0=>'rock',1=>'paper',2=>'scissors',3=>'lizard',4=>'spock'],
    Hash[0=>%w(scissors lizard),1=>%w(rock spock),2=>%w(paper lizard),3=>%w(spock paper),4=>%w(rock scissors)]

def main_menu
  print "\n\nMain Menu\n\n1. Play Against the Computer\n2. Play Against Your Friend (or enemy)
3. Bonus (Play Rock-Paper-Scissors-Lizard-Spock)\n4. What is Rock-Paper-Scissors-Lizard-Spock?\n\n0. Exit.\n\nWhat would you like to do?: "
  gets.chomp.to_i
end

def rules_to_spock
  puts "\nScissors cuts Paper\nPaper covers Rock\nRock crushes Lizard\nLizard poisons Spock\nSpock smashes Scissors
Scissors decapitates Lizard\nLizard eats Paper\nPaper disproves Spock\nSpock vaporizes Rock
And as it always has, Rock crushes Scissors.\n\n-Sheldon Cooper, The Big Bang Theory\n\n"
end

def score_board(player_one, player_two, ties, final)
  puts "\nFinal Scoring:" if final
  puts '*' * 20 + "\n* Player 1:".ljust(16) + (player_one.to_s + ' *').rjust(5)
  print '* Player 2:'.ljust(16) + (player_two.to_s + " *\n").rjust(5)
  print '* Ties:'.ljust(16) + (ties.to_s + " *\n").rjust(5) + '*' * 20
end

def choose_hand(computer=false, spock=false)
  incomplete, hand, random_integer = true, -1, -1
  while incomplete
    if spock
      print "\nWhat's Your Sign?\n0. Rock\n1. Paper\n2. Scissors\n3. Lizard\n4. Spock\n\nPlease enter a choice: "
      hand = gets.chomp.to_i
      if 0 <= hand and hand <= 4
        random_integer = rand(0..4) if computer
        incomplete = false
      end
    else
      print "\n0. Rock\n1. Paper\n2. Scissors\n\nPlease enter a choice: "
      hand = gets.chomp.to_i
      if 0 <= hand and hand <= 2
        random_integer = rand(0..2) if computer
        incomplete = false
      end end end
  return hand, random_integer if computer
  hand
end

def results(basic_rules, assignments, p1, p2, ties, hand_one, hand_two, opponent)
  puts "#{opponent} threw #{assignments[hand_two]} and you threw #{assignments[hand_one]}"
  if hand_one == hand_two
    puts "It's a tie!"
    ties += 1
  elsif basic_rules[hand_two].include? assignments[hand_one]
    puts "#{opponent} Wins! EOL"
    p2 += 1
  else
    puts "\nCongratulations, you win!"
    p1 += 1
  end
  return p1, p2, ties
end

def go_again
  print "\nGo Again? (y/n): "
  true if gets.chomp != 'n'
end

def game(basic_rules, assignments, human=false, computer=false, spock=false)
  player_one, player_two, ties, continuing = 0, 0, 0, true
  while continuing
    hand_one, hand_two = choose_hand(computer, spock)
    hand_two = choose_hand if human
    player_one, player_two, ties = results(basic_rules, assignments, player_one, player_two, ties, hand_one, hand_two, 'Player 2')
    score_board(player_one, player_two, ties, false)
    continuing = go_again
  end
  score_board(player_one, player_two, ties, true)
end

def main_control(basic_rules, assignments)
  choice = nil
  while choice!=0 do
    choice = main_menu
    case choice
      when 1; game(basic_rules, assignments, false, true, false)
      when 2; game(basic_rules, assignments, true, false, false)
      when 3; game(basic_rules, assignments, false, false, true)
      when 4; rules_to_spock
      when 0; puts
      else; puts 'please enter a valid choice'
    end end end

puts "\n\nWelcome to Rock Paper Scissors!\n\n\nYou must choose rock paper or scissors.
The Computer will then pick one. Based on the choices, you will either win, lose, or tie.
The standard rules are: Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.\n\n"
main_control(basic_rules, assignments)
puts 'Thank you for playing!'
