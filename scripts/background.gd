extends TextureRect

@export var speed : float = 10.0
@export var radius : float = 192.0
var constellations : Array[Node]

func _ready():
	Progress.checkpoint_reached.connect(_on_checkpoint_reached)
	constellations = get_children()

func _process(_delta):
	if GameStatus.current_state == GameStatus.GAME_STATE.EXPLORATION:
		move()

func _on_checkpoint_reached(level : int):
	constellations[level+1].show()

func move():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var new_pos : Vector2 = position - input_direction.normalized() * speed
	position = clamp_pos(new_pos)

func clamp_pos(pos):
	var new_pos : Vector2
	new_pos.x = clamp(pos.x, -size.x + get_viewport_rect().size.x - 109, 109)
	new_pos.y = clamp(pos.y, -size.y + get_viewport_rect().size.y - 4, 4)
	return new_pos
