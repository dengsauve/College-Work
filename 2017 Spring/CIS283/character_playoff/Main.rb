############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Main Class
#
############################################################

require_relative('Character')
require_relative('Dice')
require_relative('Item')
require_relative('Weapon')
require_relative('Armor')

def display_menu
  choice = 0
  until (1..4).include?(choice)
    puts "\n-- Main Menu --"
    puts "1.\tLoad Character 1
2.\tLoad Character 2
3.\tFight
4.\tQuit"
    print "\nenter your selection: "
    choice = gets.chomp.to_i
  end
  choice
end

# noinspection RubyArgCount
def load_character(textfile)
  data, args = File.open(textfile, 'r'), []
  until data.eof?
    args << data.readline.split(',')
  end
  data.close
  weapon = Weapon.new(args[1][0], args[1][1].strip.to_i)
  armor = Armor.new(args[2][0], args[2][1].strip.to_i)
  # name, race, hit_points, strength, agility, weapon, armor
  Character.new(args[0][0], args[0][1], args[0][2].strip.to_i, args[0][3].strip.to_i, args[0][4].strip.to_i, weapon, armor)
end

character1 =
character2 =

while true
  case display_menu
    when 1
      character1 = load_character('gimli.txt')
      puts character1.to_s
    when 2
      character2 = load_character('legolas.txt')
      puts character2.to_s
    when 3
      #fight
    else
      exit
  end
end