extends Node

@onready var inventory : Array[Constellation] = []

var current_puzzle : Puzzle
const IMAGE_LIMIT = 3

signal puzzle_completed(id : int)

func _input(event):
	if event.is_action_pressed("combine"):
		verify_solution()

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
		puzzle_completed.emit(current_puzzle.id)
		set_current_puzzle(null)
		
	empty_inventory()
