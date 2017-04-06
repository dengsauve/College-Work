def half_circle (degrees, distance)
	9.times do
		turn degrees
		walk 20
		turn degrees
	end
	walk distance
end
def turn_walk (degrees, distance)
	turn degrees
	walk distance
end
def turn_jump (degrees, distance)
	turn degrees
	jump distance
end
def letter_r
	color red
	walk 225
	turn_walk -90, 100
	half_circle -10, 100
	turn_jump 180, 100
	turn_walk -55, 140
end
def letter_u
	turn_jump 55, 25
	turn_jump 90, 225
	color blue
	turn_walk 180, 170
	half_circle 10, 170
end
def letter_b
	color green
	turn_jump -90, 50
	turn_walk -90, 225
	turn_walk 90, 50
	half_circle 10, 50
	turn_jump 180, 50
	half_circle 10, 50
	turn_walk 90, 5
end
def letter_y
	color yellow
	turn_jump 90, 100
	turn_walk -45, 100
	turn_walk 90, 100
	turn_jump 180, 100
	turn_walk 45, 155
	jump 100
	turn_jump -90, 543
	turn_jump 90, 225
	turn 180
end
def letter_l
	color green
	turn_jump -90, 50
	turn_walk -90, 225
	turn_walk 90, 100
end
def letter_e
	color yellow
	jump 50
	walk 100
	turn_jump 180, 100
	turn_walk -90, 115
	turn_walk -90, 75
	turn_jump 180, 75
	turn_walk -90, 110
	turn_walk -90, 100
end
def letter_s
	color black
	jump 50
	turn_jump -90, 225
	turn_walk 90, 100
	half_circle 10, 45
	half_circle -10, 100
end
letter_r
letter_u
letter_b
letter_y
letter_r
letter_u
letter_l
letter_e
letter_s