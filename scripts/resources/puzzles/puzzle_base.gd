extends Resource
class_name Puzzle

@export_multiline var hint_text : String
@export var solution_list : Array[Constellation]

func is_answer_correct(answer : Array[Constellation]) -> bool:
	if len(solution_list) != len(answer): return false
	
	for img in solution_list:
		if not answer.has(img):
			return false
			
	return true
