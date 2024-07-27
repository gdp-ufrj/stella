extends Control

@export var puzzle : Puzzle
@export var puzzle_name : String
@onready var label : Label = $HBoxContainer/Label
@onready var box : TextureRect = $HBoxContainer/MarginContainer2/TextureRect
@onready var done : bool = false

func _ready():
	label.text = puzzle_name

func _process(_delta):
	if done: return
	if Progress.puzzles_status[puzzle.id]:
		box.texture = load("res://assets/hud/box_checked.png")
		done = true

func _on_button_pressed():
	select_puzzle()

func select_puzzle():
	GameStatus.set_current_puzzle(puzzle)
