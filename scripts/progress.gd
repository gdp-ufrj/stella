extends Node

@onready var completed_count = 0
@onready var puzzles_status = {
	1: false,
	2: false,
	3: false,
	4: false,
	5: false, 
	6: false, 
	7: false, 
	8: false, 
	9: false, 
	10: false, 
	11: false, 
	12: false, 
	13: false, 
	14: false, 
	15: false, 
	16: false,
}

func _ready():
	GameStatus.puzzle_completed.connect(_on_game_status_puzzle_completed)

func _on_game_status_puzzle_completed(id : int):
	if puzzles_status[id]: return # Puzzle already completed
	
	puzzles_status[id] = true
	update_completed_count()

func update_completed_count():
	completed_count += 1
