extends Node

@onready var inventory : Array[Constellation] = []

var current_puzzle : Puzzle
const IMAGE_LIMIT = 3

func _process(delta):
	print("oi")

func add_new_image(img : Constellation):
	if len(inventory) < IMAGE_LIMIT:
		inventory.append(img)

func empty_inventory():
	inventory.clear()

func set_current_puzzle(new_puzzle : Puzzle):
	current_puzzle = new_puzzle
