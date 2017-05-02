############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/22/2017
#  Assignment:   Jukebox
#  Class:        CIS 283
#  Description:  Jukebox holds the Jukebox class which has
#                an array of song objects.
#                [X] Write another class called Jukebox which handles
#                storing multiple songs into an array that is
#                INSIDE the Jukebox class.
#                An object created from this class should respond to:
#                  [X] adding
#                  [X] deleting
#                  [X] updating
#                  [X] listing all of the Song objects stored inside of it.
#
############################################################

class Jukebox
  def initialize
    @library = []
  end

  def archive_songs
    @library
  end

  def add(track)
    @library << track
    "\n#{track.info} added to Library.\n\n"
  end

  def delete(song_index)
    @library.delete_at(song_index)
  end

  def contents
    ret_str = ''
    @library.each_with_index do |song, index|
      ret_str += (index+1).to_s + ".\t"
      ret_str += song.details + "\n"
    end
    ret_str
  end

  def songs_longer_than(seconds)
    ret_str = ''
    @library.each do |song|
      if song.length.to_i > seconds
        ret_str += song.details + "\n"
      end
    end
    ret_str
  end

  def songs_by_artist(artist, ret_str='')
    @library.each do |song|
      if song.artist == artist
        ret_str += '=> ' + song.details + "\n"
      end
    end
    ret_str
  end

  def play_song(song_selection)
    @library[song_selection].play
  end

  def details_by_index(song_index)
    @library[song_index].details
  end

  def load_songs(song_array)
    @library = song_array
  end

end