############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/02/17
#  Assignment:   Character Playoff
#  Class:        CIS283
#  Description:  Main Class
#
############################################################

require_relative('lib/Character')
require_relative('lib/Dice')
require_relative('lib/Item')
require_relative('lib/Weapon')
require_relative('lib/Armor')
require_relative('lib/Menu')

# noinspection RubyArgCount
def load_character(textfile)
  data, args = File.open(textfile, 'r'), []
  until data.eof?
    args << data.readline.split(',')
  end
  data.close

  weapon = Weapon.new(
      args[1][0], # Name
      args[1][1].strip.to_i # Damage Hits
  )
  armor = Armor.new(
      args[2][0], # Name
      args[2][1].strip.to_i # Protection Hits
  )
  return Character.new(
      args[0][0], # Name
      args[0][1], # Race
      args[0][2].strip.to_i, # Hits
      args[0][3].strip.to_i, # Strength
      args[0][4].strip.to_i, # Agility
      weapon,
      armor
  )
end

def fight(character1, character2, dice_bag)
  while character1.current_hit_points > 0 && character2.current_hit_points > 0
    outcome = 0
    while outcome == 0 # Prevent Ties
      outcome = dice_bag[0].roll - dice_bag[1].roll
    end
    if outcome > 0 # Character 1 wins the roll
      combat(character2, character1, dice_bag)
    else # Character 2 wins the roll
      combat(character1, character2, dice_bag)
    end
    print 'Press enter to continue'
    gets
  end

  puts "\n#{character1.name if character1.current_hit_points > 0}#{character2.name if character2.current_hit_points > 0} WINS!"
  puts '-------------------------'
  puts character1.current_status
  puts character2.current_status
  puts "-------------------------\n\n"
end

def combat(target, attacker, dice_bag)
  puts '', attack(target, attacker, dice_bag)
  if target.current_hit_points > 0 and attacker.current_hit_points > 0
    puts attack(attacker, target, dice_bag) + "\n\n"
  else
    puts "\n\n"
  end
end

def attack(target, attacker, dice_bag)
  puts "#{attacker.name} fights with #{attacker.weapon.name}"
  if dice_bag[4].roll < attacker.agility
    hit = (attacker.strength * 1.0/dice_bag[2].roll + attacker.weapon.damage_hits/dice_bag[4].roll).to_i
    armor_save = (1.0 * target.armor.protection_hits / dice_bag[6].roll ).to_i
    if (hit - armor_save) > 0
      damage = hit - armor_save
    else
      damage = 0
    end

    puts "\tHit: #{hit}\t#{target.name}'s armor saves #{armor_save}"
    puts "\t#{target.name}'s hit points are reduced by #{damage}"
    target.reduce_hits(damage)
    puts "\t" + target.current_status
  else
    puts "\tMisses!"
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
      character1 = load_character('characters/gimli.txt')
      character1_created = true
      puts '', character1.to_s, ''
    when 2
      character2 = load_character('characters/legolas.txt')
      character2_created = true
      puts '', character2.to_s, ''
    when 3
      if character1_created and character2_created
        fight(character1, character2, dice_bag)
      else
        puts "\nYou need to load#{' Character 1' unless character1_created}#{' Character 2' unless character2_created}.\n\n"
      end
    when main_menu.quit
      exit
    else
      puts "\nInvalid Entry\n\n"
  end
end