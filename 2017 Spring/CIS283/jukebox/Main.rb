############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/22/2017
#  Assignment:   Jukebox
#  Class:        CIS 283
#  Description:  Main.rb is a the brains of the Jukebox
#                [X] The main program should implement a menu that allows a user to create a new song and fill in the
#                    appropriate information.
#                [X] Write a method for converting the object into a tab delimited string suitable for writing/saving.
#                [X] Store the information for each new song in a new Song object.
#                [X] Then add that song to the Jukebox object through the method "add_song".
#                [X] Get Rid of any .each items!!!
#
############################################################

require_relative('Jukebox')
require_relative('Songs')

def startup(file_name, jukebox)
  song_library = []
  File.open(file_name, 'r').readlines.each do |line|
    args = line.split("\t")
    song_library << (Song.new(args[0], args[1], args[2], args[3], args[4], args[5]))
  end
  jukebox.load_songs(song_library)
end


def show_menu
  puts "--- Main Menu --- \n1)  Show all songs that are longer than a user entered value (in seconds)
2)	Show All songs that were written by a specific author (user entered name)
3)	Play a specific song
4)	Add a new song to the jukebox from user input
5)	Delete a song from the jukebox
6)	Update a song in the jukebox
7)	Show all songs in the jukebox
8)  Quit
9)  Quit Without Saving\n\n"
end


def main_menu(choice = 0)
  until (1..9).to_a.include?(choice)
    show_menu
    print 'Selection: '
    choice = gets.chomp.to_i
  end
  choice
end


def songs_longer_than_seconds(jukebox)
  print "\nEnter the minimum length in seconds for a song: "
  seconds = gets.chomp
  if seconds.to_i.to_s == seconds
    puts '', "Songs over #{seconds} seconds long:", '-'*"Songs over #{seconds} seconds long:".length
    puts jukebox.songs_longer_than(seconds.to_i), ''
  else
    puts "\nNot a valid number.\n\n"
  end
end


def songs_by_artist(jukebox)
  print "\nEnter the artist\'s name to see the selections: "
  artist = gets.chomp
  title("Songs by #{artist}")
  puts jukebox.songs_by_artist(artist) + "\n"
end


def play_song(jukebox)
  title('What song would you like to play?')
  puts jukebox.contents
  print "\nSelection: "
  song_selection = gets.chomp
  if song_selection.to_i.to_s == song_selection
    if (1..jukebox.count).include?(song_selection.to_i)
      puts '', jukebox.play_song(song_selection.to_i - 1), ''
    else
      puts "\nInvalid Selection\n\n"
    end
  else
    puts "\nNot a Valid Number.\n\n"
  end
end


def add_song_to_jukebox(jukebox)
  puts
  puts jukebox.add(create_song)
end


def create_song
  # a song is (title, artist, album, year, comments, length)
  title = please_enter("the song's title")
  artist = please_enter("the song's artist")
  album = please_enter("the album the song's on")
  year = please_enter('the year the song was released')
  comments = please_enter('any comments about the song')
  length = please_enter('the length of the song in seconds')
  Song.new(title, artist, album, year, comments, length)
end


def delete_song_from_jukebox(jukebox)
  title('What song would you like to Delete?')
  puts jukebox.contents, ''
  song_index = gets.chomp
  if song_index.to_i.to_s == song_index
    if (1..jukebox.count).include?(song_index.to_i)
      jukebox.delete(song_index.to_i - 1)
      puts 'Song Deleted', ''
    else
      puts "\nInvalid Selection.\n\n"
    end
  else
    puts "\nNot a Valid Number.\n\n"
  end
end


def update_song_in_jukebox(jukebox)
  title('What song would you like to Update?')
  puts jukebox.contents, ''
  song_index = gets.chomp
  if song_index.to_i.to_s == song_index
    if (1..jukebox.count).include?(song_index.to_i)
      updated_track = create_song
      title('Are you sure you want to replace?')
      puts "Original: #{jukebox.details_by_index(song_index.to_i - 1)}"
      puts "Replacement: #{updated_track.details}"
      print "\n", 'enter to continue, N to cancel'
      if gets.chomp != 'N'
        jukebox.delete(song_index.to_i - 1)
        puts jukebox.add(updated_track)
      end
    else
      puts "\nInvalid Selection.\n\n"
    end
  else
    puts "\nNot a Valid Number.\n\n"
  end
end


def show_songs_in_jukebox(jukebox)
  title('All Songs Available in Jukebox')
  puts jukebox.contents,''
end


def shutdown(file_name, jukebox)
  archive = File.open(file_name, 'w+')
  jukebox.archive_songs.each do |song|
    archive.puts song.to_tab
  end
  archive.close
  exit
end


def please_enter(variable_string)
  print "Please enter #{variable_string}: "
  gets.chomp
end


def title(title_string)
  puts '', title_string, '-'*title_string.length
end


seeburg_m100c = Jukebox.new
startup('Songs.txt', seeburg_m100c)

continuing = true
while continuing
  case main_menu
    when 1
      songs_longer_than_seconds(seeburg_m100c)
    when 2
      songs_by_artist(seeburg_m100c)
    when 3
      play_song(seeburg_m100c)
    when 4
      add_song_to_jukebox(seeburg_m100c)
    when 5
      delete_song_from_jukebox(seeburg_m100c)
    when 6
      update_song_in_jukebox(seeburg_m100c)
    when 7
      show_songs_in_jukebox(seeburg_m100c)
    when 8
      shutdown('Songs.txt', seeburg_m100c)
    when 9
      exit
    else
      puts 'epic fail'
  end
end
