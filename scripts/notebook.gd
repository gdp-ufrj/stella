extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer
var puzzles : Array[Node]

func _ready():
	hide()
	puzzles = $Notebook/Puzzles.get_children()
	Progress.checkpoint_reached.connect(_on_checkpoint_reached)
	GameStatus.enable_notebook.connect(show)

func _on_notebook_button_pressed():
	if GameStatus.current_state == GameStatus.GAME_STATE.EXPLORATION:
		animation_player.play("open_notebook_menu")
		GameStatus.change_state(GameStatus.GAME_STATE.NOTEBOOK)

func _on_first_puzzle_completed():
	show()

func _on_close_button_pressed():
	animation_player.play("close_notebook_menu")
	GameStatus.change_state(GameStatus.GAME_STATE.EXPLORATION)
	# To release all focus from children, not sure why it works
	hide()
	show()

func _on_checkpoint_reached(level : int):
	puzzles[level+1].show()
