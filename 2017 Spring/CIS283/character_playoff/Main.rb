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
  Character.new(args[0][0], args[0][1], args[0][2].strip.to_i, args[0][3].strip.to_i, args[0][4].strip.to_i, weapon, armor)
end

def fight(character1, character2)
  c1d6, c2d6 = Dice.new(6), Dice.new(6)
  while character1.current_hit_points > 0 and character2.current_hit_points > 0
    outcome = 0
    while outcome == 0
      outcome = c1d6.roll - c2d6.roll
    end
    if outcome < 0
      puts attack(character1, character2)
      if character1.current_hit_points > 0 and character2.current_hit_points > 0
        puts attack(character2, character1) + "\n\n"
      end
    else
      puts attack(character2, character1)
      if character1.current_hit_points > 0 and character2.current_hit_points > 0
        puts attack(character1, character2) + "\n\n"
      end
    end
  end
  ret_str = "\n#{character1.name + ' WINS!' if character1.current_hit_points > 0}#{character2.name + ' WINS!' if character2.current_hit_points > 0}\n"
  ret_str += "-------------------------\n"
  ret_str += character1.current_status + "\n"
  ret_str += character2.current_status + "\n"
  ret_str += "-------------------------\n"
  return ret_str
end

def attack(target, attacker)
  ret_str = ''
  ret_str += "#{attacker.name} fights with #{attacker.weapon.name}\n"
  if Dice.new(10).roll < attacker.agility
    hit = ((attacker.strength * (1.0/Dice.new(4).roll)) + ((attacker.weapon.damage_hits)/Dice.new(8).roll)).to_i
    armor_save = (1.0 * target.armor.protection_hits / Dice.new(15).roll ).to_i
    (hit - armor_save) > 0 ? damage = hit - armor_save : damage = 0
    ret_str += "\tHit: #{hit}\t#{target.name}'s armor saves #{armor_save}\n"
    ret_str += "#{target.name}'s hit points are reduced by #{damage}\n"
    target.reduce_hits(damage)
    ret_str += target.current_status
    return ret_str
  else
    ret_str += "Misses!\n"
    return ret_str
  end
end


character1, character2 = Character, Character
character1_created, character2_created = false, false

while true
  case display_menu
    when 1
      character1 = load_character('gimli.txt')
      puts character1.to_s
      character1_created = true
    when 2
      character2 = load_character('legolas.txt')
      puts character2.to_s
      character2_created = true
    when 3
      if character1_created and character2_created
        puts fight(character1, character2)
      else
        puts "You need to load#{' Character 1' unless character1_created}#{' Character 2' unless character2_created}."
      end
    else
      exit
  end
end