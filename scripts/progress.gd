extends Node

signal checkpoint_reached(level : int)
signal end_puzzle_done()

@onready var completed_count = 0
@onready var checkpoints : Array[int] = [2,4,6,8,10]
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
	17: false,
}

func _ready():
	GameStatus.puzzle_completed.connect(_on_game_status_puzzle_completed)

func _on_game_status_puzzle_completed(id : int):
	if puzzles_status[id]: return # Puzzle already completed
	if id == 17: end_puzzle_done.emit()
	
	puzzles_status[id] = true
	update_completed_count()

func update_completed_count():
	completed_count += 1
	var check = checkpoints.find(completed_count)
	if check == -1: return
	checkpoint_reached.emit(check)
