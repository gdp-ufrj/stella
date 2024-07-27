extends TextureRect

@export var speed : float = 10.0
@export var radius : float = 192.0

func _ready():
	print(size)

func _process(_delta):
	move()

func move():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var new_pos : Vector2 = position - input_direction.normalized() * speed
	position = clamp_pos(new_pos)

func clamp_pos(pos):
	var new_pos : Vector2
	new_pos.x = clamp(pos.x, -size.x + get_viewport_rect().size.x, 0)
	new_pos.y = clamp(pos.y, -size.y + get_viewport_rect().size.y, 0)
	return new_pos
