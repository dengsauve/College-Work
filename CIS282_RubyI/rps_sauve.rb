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

assignments = Hash[
    0 => 'rock',
    1 => 'paper',
    2 => 'scissors',
    3 => 'lizard',
    4 => 'spock'
]

basic_rules = Hash[
    0 => %w(scissors lizard),
    1 => %w(rock spock),
    2 => %w(paper lizard),
    3 => %w(spock paper),
    4 => %w(rock scissors)
]

def welcome
  puts "\n\nWelcome to Rock Paper Scissors!
\n\nThis is a game of chance. You must choose rock paper or scissors.
The Computer will then pick one. Based on the choices, you will either win, lose, or tie.
The standard rules are: Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.\n\n"
end

def main_menu
  puts "Main Menu\n
1. Play Against the Computer
2. Play Against Your Friend (or enemy)
3. Bonus (Play Rock-Paper-Scissors-Lizard-Spock)
4. What is Rock-Paper-Scissors-Lizard-Spock?
\n0. Exit."
  print "\nWhat would you like to do? "
  gets.chomp.to_i
end

def score_board(player_one, player_two, ties)
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
  puts "\nScissors cuts Paper
Paper covers Rock
Rock crushes Lizard
Lizard poisons Spock
Spock smashes Scissors
Scissors decapitates Lizard
Lizard eats Paper
Paper disproves Spock
Spock vaporizes Rock
And as it always has, Rock crushes Scissors.

-Sheldon Cooper, The Big Bang Theory\n\n"
end

def computer_game(basic_rules, assignments)
  player_one, computer, ties, continuing = 0, 0, 0, true
  while continuing
    incomplete, random_integer, hand = true, -1, -1
    while incomplete
      puts "\n0. Rock\n1. Paper\n2. Scissors"
      print 'Please enter a choice: '
      hand = gets.chomp.to_i
      if hand >= 0 and hand <=2
        random_integer = rand(0..2)
        incomplete = false
      end
    end
    puts "Computer threw #{assignments[random_integer]} and you threw #{assignments[hand]}"
    if random_integer == hand
      puts "It's a tie!"
      ties += 1
    elsif basic_rules[random_integer].include? assignments[hand]
      puts 'The Computer Wins! EOL'
      computer += 1
    else
      puts "\nCongratulations, you win!"
      player_one += 1
    end
    score_board(player_one, computer, ties)
    print "\nGo Again? (y/n): "
    if gets.chomp == 'n'
      continuing = false
    end
  end
  puts "\nFinal Scoring:"
  score_board(player_one, computer, ties)
end


def human_game(basic_rules, assignments)
  player_one, player_two, ties, continuing = 0, 0, 0, true
  while continuing
    incomplete, hand_one, hand_two = true, -1, -1
    while incomplete
      puts "\n0. Rock\n1. Paper\n2. Scissors"
      print 'Player 1, please enter a choice: '
      hand_one = gets.chomp.to_i
      if hand_one >= 0 and hand_one <=2
        incomplete = false
      end
    end
    incomplete = true
    while incomplete
      puts "\n0. Rock\n1. Paper\n2. Scissors"
      print 'Player 2, please enter a choice: '
      hand_two = gets.chomp.to_i
      if hand_two >= 0 and hand_two <=2
        incomplete = false
      end
    end
    puts "Player 1 threw #{assignments[hand_one]} and Player 2 threw #{assignments[hand_two]}"
    if hand_one == hand_two
      puts "\nIt's a tie!"
      ties += 1
    elsif basic_rules[hand_one].include? assignments[hand_two]
      puts "\nPlayer 1 Wins!"
      player_one += 1
    else
      puts "\nPlayer 2 Wins!"
      player_two += 1
    end
    score_board(player_one, player_two, ties)
    print "\nGo Again? (y/n): "
    if gets.chomp == 'n'
      continuing = false
    end
  end
  puts "\nFinal Scoring:"
  score_board(player_one, player_two, ties)
end


def spock_game(basic_rules, assignments)
  player_one, computer, ties, continuing = 0, 0, 0, true
  while continuing
    incomplete, random_integer, hand = true, -1, -1
    while incomplete
      puts "\nWhat's Your Sign?\n0. Rock\n1. Paper\n2. Scissors\n3. Lizard\n4. Spock\n"
      print 'Please enter a choice: '
      hand = gets.chomp.to_i
      if hand >= 0 and hand <=4
        random_integer = rand(0..4)
        incomplete = false
      end
    end
    puts "Computer threw #{assignments[random_integer]} and you threw #{assignments[hand]}"
    if random_integer == hand
      puts "It's a tie!"
      ties += 1
    elsif basic_rules[random_integer].include? assignments[hand]
      puts 'The Computer Wins! EOL'
      computer += 1
    else
      puts "\nCongratulations, you win!"
      player_one += 1
    end
    score_board(player_one, computer, ties)
    print "\nGo Again? (y/n): "
    if gets.chomp == 'n'
      continuing = false
    end
  end
  puts "\nFinal Scoring:"
  score_board(player_one, computer, ties)
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

welcome
main_control(basic_rules, assignments)
puts 'Thank you for playing!'