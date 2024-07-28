extends TextureProgressBar

var value_levels = [63, 69, 75, 82, 88, 100]

func change_progress(level): 
	value = value_levels[level]
