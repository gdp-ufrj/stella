extends TextureProgressBar

var value_levels = [63, 69, 75, 82, 88, 100]

func _ready():
	Progress.checkpoint_reached.connect(_on_checkpoint_reached)

func _on_checkpoint_reached(level : int):
	change_progress(level+1)

func change_progress(level): 
	value = value_levels[level]
