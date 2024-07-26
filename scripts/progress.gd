extends Node

var puzzles_status = {
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
	puzzles_status[id] = true
	print(get_completed_count())

func get_completed_count() -> int:
	var count = 0
	for val in puzzles_status.values():
		if val == true: count += 1
	
	return count
