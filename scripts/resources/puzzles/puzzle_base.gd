extends Resource
class_name Puzzle

@export_multiline var hint_text : String
@export var solution_list : Array[Constellation]

func verify_solution(answer : Array[Constellation]):
	pass # function to verify if the answer passed is the correct solution
