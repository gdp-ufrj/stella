extends AudioStreamPlayer2D

var select_sfx = load("res://assets/audio/select_sfx.wav")

func play_sfx(sfx : String):
	match sfx:
		"select":
			stream = select_sfx
			play()
