require_relative('Songs')

song_one = Song.new('a','b','a','b','a','b')
song_two = Song.new('a','b','a','b','a','c')

print song_one.to_tab, song_two.to_tab