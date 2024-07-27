extends Node

@onready var inventory : Array[Constellation] = []

var current_puzzle : Puzzle
const IMAGE_LIMIT = 3

signal puzzle_completed(id : int)

func add_new_image(img : Constellation) -> bool:
	if len(inventory) >= IMAGE_LIMIT: return false
	if inventory.has(img): return false
	
	inventory.append(img)
	return true

func empty_inventory():
	inventory.clear()

func set_current_puzzle(new_puzzle : Puzzle):
	current_puzzle = new_puzzle

func verify_solution():
	if not current_puzzle:
		empty_inventory()
		return

	if current_puzzle.is_answer_correct(inventory):
		puzzle_completed.emit(current_puzzle.id)
		set_current_puzzle(null)
		
	empty_inventory()
