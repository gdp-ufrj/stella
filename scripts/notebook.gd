extends Node

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _on_notebook_button_pressed():
	animation_player.play("open_notebook_menu")
	GameStatus.change_state(GameStatus.GAME_STATE.NOTEBOOK)


func _on_close_button_pressed():
	animation_player.play("close_notebook_menu")
	GameStatus.change_state(GameStatus.GAME_STATE.EXPLORATION)
