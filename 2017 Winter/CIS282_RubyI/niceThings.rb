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
def letter_t
	color purple
	walk 225
	turn_walk 90, 75
	turn_walk 180, 150
end
def letter_t_new_line
	color purple
	walk 225
	turn_walk 90, 75
	turn_walk 180, 150
	turn_jump 180, 75
	turn_walk 90, 255
	turn_walk -90, 950
	turn_walk 90, 20
end
def letter_h
	color blue
	turn_walk -90, 225
	turn_walk 180, 100
	turn_walk -90, 50
	turn_walk 90, 125
	turn_walk 180, 225
	turn_walk 90, 50
end
def letter_h_to_a
	color blue
	walk 225
	turn_walk 180, 100
	turn_walk -90, 50
	turn_walk -90, 100
	turn_walk 180, 225
	turn_walk -90, 25
end
def letter_i
	color black
	walk 25
	turn_walk 90, 225
	turn_walk 90, 25
	turn_walk 180, 50
	turn_jump -90, 225
	turn_walk -90, 25
	turn_walk 180, 75
end
def letter_i_from_n
	color black
	walk 225
	turn_walk 90, 25
	turn_walk 180, 50
	turn_jump -90, 225
	turn_walk -90, 25
	turn_walk 180, 75
end
def letter_s
	color orange
	walk 25
	half_circle 10, 25
	half_circle -10, 75
	turn_walk -75, 235
	turn 75
end
def letter_s_to_w
	color green
	walk 25
	half_circle 10, 25
	half_circle -10, 125
end
def letter_s_last
	color orange
	walk 25
	half_circle 10, 25
	half_circle -10, 75
end
def letter_w
	color red
	turn_walk -75, 235
	turn_walk 150, 100
	turn_walk -150, 100
	turn_walk 150, 235
	turn_walk -75, 25
end
def letter_y
	walk 75
	color orange
	turn_walk 90, 125
	turn_walk 45, 145
	turn_jump 180, 145
	turn_walk 90, 145
	turn_walk -180, 145
	turn_walk 45, 150
	turn_walk -90, 1100
	turn_walk 90, 10
	turn 90
end
def letter_e
	color green
	walk 150
	turn_jump 180, 150
	turn_walk 90, 125
	turn_walk 90, 100
	turn_jump 180, 100
	turn_walk 90, 100
	turn_walk 90, 200
end
def letter_e_new_line
	color green
	walk 150
	turn_jump 180, 150
	turn_walk 90, 125
	turn_walk 90, 100
	turn_jump 180, 100
	turn_walk 90, 100
	turn_walk 90, 160
	turn_walk -90, 20
	turn_walk -90, 1200
	turn_walk 90, 250
	turn_walk 90, 100
	turn 90
end
def letter_c
	walk 150
	color black
	turn 180
	walk 50
	9.times do
		turn -10
		walk 39
		turn -10
	end
	walk 50
end
def letter_a
	walk 100
	color orange
	turn_walk -110, 240
	turn_jump 180, 240
	turn_walk -140, 140
	turn_walk -110, 100
	turn_jump 180, 100
	turn_walk -70, 100
	turn_walk 70, 50
end
def letter_n
	color black
	turn_walk 90, 225
	turn_walk -160, 240
	turn_walk 160, 225
	turn_jump 180, 225
	turn_walk 90, 100
	turn 90
end
def letter_v
	color red
	turn_walk 110, 240
	turn_jump -180, 240
	turn_walk 140, 240
	turn_walk -70, 50
end
def letter_g
	turn_walk -90, 50
	turn_walk 90, 50
	turn_walk -90, 25
	turn_walk 180, 50
	turn_walk 180, 25
	turn_walk -90, 50
	turn_walk -90, 25
	9.times do
		turn -10
		walk 39
		turn -10
	end
	walk 25
	turn_walk -70, 240
	turn_walk 70, 25
end
jump 500
turn 90
jump 700
turn -90
letter_t
letter_h
letter_i
letter_s
letter_i
letter_s_to_w
letter_w
letter_h
letter_y
letter_w
letter_e
letter_c
letter_a
letter_n
letter_t_new_line
letter_h_to_a
letter_a
letter_v
letter_e
letter_n
letter_i_from_n
letter_c
letter_e_new_line
letter_t
letter_h
letter_i
letter_n
letter_g
letter_s_last
