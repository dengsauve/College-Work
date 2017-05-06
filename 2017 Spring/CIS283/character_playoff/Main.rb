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
require_relative('Menu')

# noinspection RubyArgCount
def load_character(textfile)
  data, args = File.open(textfile, 'r'), []
  until data.eof?
    args << data.readline.split(',')
  end
  data.close

  weapon = Weapon.new(
      args[1][0],
      args[1][1].strip.to_i
  )
  armor = Armor.new(
      args[2][0],
      args[2][1].strip.to_i
  )
  return Character.new(
      args[0][0],
      args[0][1],
      args[0][2].strip.to_i,
      args[0][3].strip.to_i,
      args[0][4].strip.to_i,
      weapon,
      armor
  )
end

def fight(character1, character2, dice_bag)
  while character1.current_hit_points > 0 and character2.current_hit_points > 0
    outcome = 0
    while outcome == 0
      dice_bag[0].roll
      dice_bag[1].roll
      outcome = dice_bag[0].showing - dice_bag[1].showing
    end
    if outcome < 0 # Character 2 wins the roll
      combat(character1, character2, dice_bag)
    else # Character 1 wins the roll
      combat(character2, character1, dice_bag)
    end
    print 'Press enter to continue'
    gets
  end

  ret_str = "\n#{character1.name + ' WINS!' if character1.current_hit_points > 0}#{character2.name + ' WINS!' if character2.current_hit_points > 0}\n"
  ret_str += "-------------------------\n"
  ret_str += character1.current_status + "\n"
  ret_str += character2.current_status + "\n"
  ret_str += "-------------------------\n\n"
  return ret_str
end

def combat(target, attacker, dice_bag)
  puts '', attack(target, attacker, dice_bag)
  if target.current_hit_points > 0 and attacker.current_hit_points > 0
    puts attack(attacker, target, dice_bag) + "\n\n"
  else
    puts
  end
end

def attack(target, attacker, dice_bag)
  ret_str = ''
  ret_str += "#{attacker.name} fights with #{attacker.weapon.name}\n"
  dice_bag[4].roll
  if dice_bag[4].showing < attacker.agility
    dice_bag[2].roll
    dice_bag[4].roll
    dice_bag[6].roll
    hit = (attacker.strength * 1.0/dice_bag[2].showing + attacker.weapon.damage_hits/dice_bag[4].showing).to_i
    armor_save = (1.0 * target.armor.protection_hits / dice_bag[6].showing ).to_i
    (hit - armor_save) > 0 ? damage = hit - armor_save : damage = 0
    ret_str += "\tHit: #{hit}\t#{target.name}'s armor saves #{armor_save}\n"
    ret_str += "\t#{target.name}'s hit points are reduced by #{damage}\n"
    target.reduce_hits(damage)
    ret_str += "\t" + target.current_status
    return ret_str
  else
    ret_str += "\tMisses!"
    return ret_str
  end
end


character1, character2 = Character, Character
character1_created, character2_created = false, false
dice_bag = [
    Dice.new(6),
    Dice.new(6),
    Dice.new(4),
    Dice.new(5),
    Dice.new(8),
    Dice.new(10),
    Dice.new(15)
]
main_menu = Menu.new(
    'Load Character 1',
    'Load Character 2',
    'Fight',
    'Quit'
)

main_menu.title=('-- Main Menu --')

while true
  case main_menu.get_menu_choice
    when 1
      character1 = load_character('gimli.txt')
      character1_created = true
      puts '', character1.to_s, ''
    when 2
      character2 = load_character('legolas.txt')
      character2_created = true
      puts '', character2.to_s, ''
    when 3
      if character1_created and character2_created
        puts fight(character1, character2, dice_bag)
      else
        puts "\nYou need to load#{' Character 1' unless character1_created}#{' Character 2' unless character2_created}.\n\n"
      end
    when main_menu.quit
      exit
    else
      puts "\nInvalid Entry\n\n"
  end
end