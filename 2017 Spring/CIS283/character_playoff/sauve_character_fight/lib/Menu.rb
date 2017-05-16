############################################################
#
#  Name:         Dennis Sauve
#  Date:         05/05/2017
#  Class:        CIS283
#  Description:  Menu Class - Accepts * string values as
#                menu options. Quit must be last.
#                30 minutes
#  Usage:        menu = Menu.new( <1 or more string options> )
#                puts menu.get_menu_choice
#                <output: user_choice as int>
#                puts menu.quit
#                <output: quit option in menu as int>
############################################################

class Menu
  # Menu Choices
  attr_reader :quit
  def initialize(*menu_args) # * is called 'Splat', indicates unknown number of args
    @menu_args = menu_args
    @quit = @menu_args.length
    @title = ''
  end

  def title=(title)
    @title = title
  end

  def get_menu_choice
    # print menu
    puts @title if @title.length > 0
    @menu_args.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
    # ask for user choice
    print "\nPlease enter your choice: "
    user_choice = gets.to_i
    # return user choice
    return user_choice
  end
end
