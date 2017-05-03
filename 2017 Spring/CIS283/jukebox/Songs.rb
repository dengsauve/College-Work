############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/22/2017
#  Assignment:   Jukebox
#  Class:        CIS 283
#  Description:  Songs.rb is a module that contains the Song class.
#                [X] Write the appropriate getter/setter methods (attr_accessor) to set the following information for each Song object
#                Title, Artist, Album, Year, Comments, Length in seconds
#                [X] Write some class methods that let you print a song’s details and "play" a song.
#                basically just print out a string that says the song is playing
#
############################################################

class Song
  attr_reader :artist, :length
  def initialize(title, artist, album, year, comments, length)
    @title = title
    @artist = artist
    @album = album
    @year = year
    @comments = comments
    @length = length
  end

  def details
    "#{@title}, by #{@artist} from the album #{@album} - #{@year}"
  end

  def info
    "#{@title}, by #{@artist}"
  end

  def play
    "Now Playing \"#{@title}\", by #{@artist}"
  end

  def to_tab
    [@title, @artist, @album, @year, @comments, @length].join("\t")
  end

end