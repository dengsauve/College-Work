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
  until (1..8).to_a.include?(choice)
    show_menu
    print 'Selection: '
    choice = gets.chomp.to_i
  end
  choice
end


def songs_longer_than_seconds
  print 'Enter the minimum length in seconds for a song: '
  seconds = gets.chomp.to_i
  puts '', "Songs over #{seconds} seconds long:", '-'*"Songs over #{seconds} seconds long:".length
  puts $seeburg_m100c.songs_longer_than(seconds), ''
end


def songs_by_artist
  print "\nEnter the artist\'s name to see the selections: "
  artist = gets.chomp
  title("Songs by #{artist}")
  puts $seeburg_m100c.songs_by_artist(artist) + "\n"
end


def play_song
  title('What song would you like to play?')
  puts $seeburg_m100c.contents
  print "\nSelection: "
  song_selection = gets.chomp.to_i - 1
  puts '', $seeburg_m100c.play_song(song_selection), ''
end


def create_song
  # a song is (title, artist, album, year, comments, length)
  title = please_enter("the song's title")
  artist = please_enter("the song's artist")
  album = please_enter("the album the song's on")
  year = please_enter('the year the song was released')
  comments = please_enter('any comments about the song')
  length = please_enter('the length of the song in minutes')
  Song.new(title, artist, album, year, comments, length)
end


def add_song_to_jukebox
  $seeburg_m100c.add(create_song)
end


def delete_song_from_jukebox
  title('What song would you like to Delete?')
  puts $seeburg_m100c.contents, ''
  song_index = gets.chomp.to_i - 1
  $seeburg_m100c.delete(song_index)
  puts 'Song Deleted', ''
end


def update_song_in_jukebox
  title('What song would you like to Update?')
  puts $seeburg_m100c.contents, ''
  song_index = gets.chomp.to_i - 1
  updated_track = create_song
  title('Are you sure you want to replace?')
  puts "Original: #{$seeburg_m100c.details_by_index(song_index)}"
  puts "Replacement: #{updated_track.details}"
  print "\n", 'enter to continue, N to cancel'
  if gets.chomp != 'N'
    $seeburg_m100c.delete(song_index)
    $seeburg_m100c.add(updated_track)
  end
  puts
end


def show_songs_in_jukebox
  title('All Songs Available in Jukebox')
  puts $seeburg_m100c.contents,''
end


def shutdown(file_name)
  archive = File.open(file_name, 'w+')
  $seeburg_m100c.archive_songs.each do |song|
    archive.puts song.to_tab
  end
  archive.close
end


def startup(file_name, jukebox=Jukebox.new)
  jukebox.load_songs(file_name)
  jukebox
end


def please_enter(variable_string)
  print "\nPlease enter #{variable_string}: "
  gets.chomp
end


def title(title_string)
  puts '', title_string, '-'*title_string.length
end


$seeburg_m100c = startup('Songs.txt')
continuing = true

while continuing
  case main_menu
    when 1
      songs_longer_than_seconds
    when 2
      songs_by_artist
    when 3
      play_song
    when 4
      add_song_to_jukebox
    when 5
      delete_song_from_jukebox
    when 6
      update_song_in_jukebox
    when 7
      show_songs_in_jukebox
    when 8
      continuing = false
      shutdown('Songs.txt')
    when 9
      continuing = false
    else
      puts 'epic fail'
  end
end
