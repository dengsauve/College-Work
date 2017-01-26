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
  puts "Main Menu\n\n1. Play Against the Computer\n2. Play Against Your Friend (or enemy)
3. Bonus (Play Rock-Paper-Scissors-Lizard-Spock)\n4. What is Rock-Paper-Scissors-Lizard-Spock?\n\n0. Exit."
  print "\nWhat would you like to do? "
  gets.chomp.to_i
end

def score_board(player_one, player_two, ties, final)
  puts "\nFinal Scoring:" if final
  puts '*' * 20
  print '* Player 1:'.ljust(15)
  puts (player_one.to_s + ' *').rjust(5)
  print '* Player 2:'.ljust(15)
  puts (player_two.to_s + ' *').rjust(5)
  print '* Ties:'.ljust(15)
  puts (ties.to_s + ' *').rjust(5)
  puts '*' * 20
end

def rules_to_spock
  puts "\nScissors cuts Paper\nPaper covers Rock\nRock crushes Lizard\nLizard poisons Spock\nSpock smashes Scissors
Scissors decapitates Lizard\nLizard eats Paper\nPaper disproves Spock\nSpock vaporizes Rock
And as it always has, Rock crushes Scissors.\n\n-Sheldon Cooper, The Big Bang Theory\n\n"
end

def choose_hand(computer)
  incomplete, hand, random_integer = true, -1, -1
  while incomplete
    puts "\n0. Rock\n1. Paper\n2. Scissors"
    print 'Please enter a choice: '
    hand = gets.chomp.to_i
    if 0 <= hand and hand <= 2
      random_integer = rand(0..2) if computer
      incomplete = false
    end
  end
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

def computer_game(basic_rules, assignments)
  player_one, computer, ties, continuing = 0, 0, 0, true
  while continuing
    hand, random_integer = choose_hand(true)
    player_one, computer, ties = results(basic_rules, assignments, player_one, computer, ties, hand, random_integer, 'The Computer')
    score_board(player_one, computer, ties, false)
    continuing = go_again
  end
  score_board(player_one, computer, ties, true)
end


def human_game(basic_rules, assignments)
  player_one, player_two, ties, continuing = 0, 0, 0, true
  while continuing
    hand_one, hand_two = choose_hand(false), choose_hand(false)
    player_one, player_two, ties = results(basic_rules, assignments, player_one, player_two, ties, hand_one, hand_two, 'Player 2')
    score_board(player_one, player_two, ties, false)
    continuing = go_again
  end
  score_board(player_one, player_two, ties, true)
end


def spock_game(basic_rules, assignments)
  player_one, computer, ties, continuing = 0, 0, 0, true
  while continuing
    incomplete, random_integer, hand = true, -1, -1
    while incomplete
      puts "\nWhat's Your Sign?\n0. Rock\n1. Paper\n2. Scissors\n3. Lizard\n4. Spock\n"
      print 'Please enter a choice: '
      hand = gets.chomp.to_i
      if 0 <= hand and hand <=4
        random_integer = rand(0..4)
        incomplete = false
      end
    end
    player_one, computer, ties = results(basic_rules, assignments, player_one, computer, ties, hand, random_integer, 'The Computer')
    score_board(player_one, computer, ties, false)
    continuing = go_again
  end
  score_board(player_one, computer, ties, true)
end


def main_control(basic_rules, assignments)
  choice = nil
  while choice!=0 do
    choice = main_menu
    case choice
      when 1
        computer_game(basic_rules, assignments)
      when 2
        human_game(basic_rules, assignments)
      when 3
        spock_game(basic_rules, assignments)
      when 4
        rules_to_spock
      when 0
        puts
      else
        puts 'please enter a valid choice'
    end
  end
end

puts "\n\nWelcome to Rock Paper Scissors!\n\n\nThis is a game of chance. You must choose rock paper or scissors.
The Computer will then pick one. Based on the choices, you will either win, lose, or tie.
The standard rules are: Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.\n\n"
main_control(basic_rules, assignments)
puts 'Thank you for playing!'
