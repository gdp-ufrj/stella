extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	Progress.end_puzzle_done.connect(_on_play_end_screen_effect)

func _on_play_end_screen_effect():
	animation_player.play("screen_bright")
