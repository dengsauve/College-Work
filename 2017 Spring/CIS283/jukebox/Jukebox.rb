############################################################
#
#  Name:         Dennis Sauve
#  Date:         04/22/2017
#  Assignment:   Jukebox
#  Class:        CIS 283
#  Description:  Jukebox holds the Jukebox class which has
#                an array of song objects.
#                [X] Write another class called Jukebox which handles storing multiple songs into an array that is INSIDE the Jukebox class.
#                An object created from this class should respond to:
#                  [X] adding
#                  [...] deleting
#                  [...] updating
#                  [X] listing all of the Song objects stored inside of it.
#
############################################################

class Jukebox
  attr_reader :library
  def initialize
    @library = []
  end
  def add(track)
    @library << track
  end
  def delete(track)
    @library.delete(track)
  end
  def update(track)
    @library.delete(track)
    @library << track
  end
  def contents
    @library.each { |i| puts i.details}
  end
end