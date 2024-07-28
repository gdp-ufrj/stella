extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	Progress.puzzle_done.connect(_on_play_screen_effect)

func _on_play_screen_effect(effect : String):
	animation_player.play(effect)
	if effect == "screen_bright":
		GameStatus.change_state(GameStatus.GAME_STATE.DIALOG) # Make a END state

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "screen_bright":
		get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
