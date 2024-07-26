extends Node

@onready var inventory : Array[Constellation] = []

var current_puzzle : Puzzle
const IMAGE_LIMIT = 3

func add_new_image(img : Constellation):
	if len(inventory) >= IMAGE_LIMIT: return
	if inventory.has(img): return
	inventory.append(img)

func empty_inventory():
	inventory.clear()

func set_current_puzzle(new_puzzle : Puzzle):
	current_puzzle = new_puzzle

func verify_solution():
	if not current_puzzle: return
	if current_puzzle.is_answer_correct(inventory):
		# Puzzle correct logic
		set_current_puzzle(null)
	else:
		# Puzzle incorrect logic
		pass
		
	empty_inventory()
