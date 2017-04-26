############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/22/2017
#  Assignment:   Jukebox
#  Class:        CIS 283
#  Description:  Main.rb is a the brains of the Jukebox
#                [X] The main program should implement a menu that allows a user to create a new song and fill in the appropriate information.
#                [ ] Write a method for converting the object into a tab delimited string suitable for writing/saving.
#                [ ] Store the information for each new song in a new Song object.
#                [ ] Then add that song to the Jukebox object through the method "add_song".
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
8)  Quit\n\n"
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
  $seeburg_m100c.library.each do |song|
    if song.length.to_i > seconds
      puts song.details
    end
  end
  puts
end


def songs_by_artist
  print 'Enter the artist\'s name to see the selections: '
  puts
  artist_name = gets.chomp
  $seeburg_m100c.library.each do |song|
    if song.artist == artist_name
      puts song.details
    end
  end
  puts
end


def play_song

end


def create_and_add_song_to_jukebox

end


def delete_song_from_jukebox

end


def update_song_in_jukebox

end


def show_songs_in_jukebox
  puts '', 'All Songs Available in Jukebox', '-'*30
  puts $seeburg_m100c.contents,''
end


def shutdown

end


def startup(file_name, jukebox=Jukebox.new)
  File.open(file_name, 'r+').readlines.each do |line|
    args = line.split("\t")
    jukebox.add(Song.new(args[0], args[1], args[2], args[3], args[4], args[5]))
  end
  jukebox
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
      create_and_add_song_to_jukebox
    when 5
      delete_song_from_jukebox
    when 6
      update_song_in_jukebox
    when 7
      show_songs_in_jukebox
    when 8
      continuing = false
      shutdown
    else
      puts 'epic fail'
  end
end


