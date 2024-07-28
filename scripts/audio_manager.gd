extends AudioStreamPlayer2D

var select_sfx = load("res://assets/audio/select_sfx.wav")
var combine_sfx = load("res://assets/audio/combine_sfx.wav")
var restart_sfx = load("res://assets/audio/restart_sfx.wav")

func play_sfx(sfx : String):
	match sfx:
		"select":
			stream = select_sfx
			play()
		"combine":
			stream = combine_sfx
			play()
		"restart":
			stream = restart_sfx
			play()
