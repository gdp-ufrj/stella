extends TextureRect

@export var lens : Array[Texture]
@export var lens_radius : Array[int]
@onready var area_2d : Area2D = $Area2D
@onready var collision_shape_2d : CollisionShape2D = $Area2D/CollisionShape2D
@onready var hint_label : Label = $"../PuzzlePanel/HintText"

var contained_stars : Array = []
var last_selectable : Star
var current_selectable : Star
var icons : Array[Sprite2D]
var current_lens = 0

func _ready():
	for ico in $"../PuzzlePanel/InventoryIcons".get_children():
		icons.append(ico)
	set_lens(current_lens)
	Progress.checkpoint_reached.connect(_on_checkpoint_reached)

func _input(event):
	mark_selected()
	if event.is_action_pressed("select"):
		if not current_selectable: return
		current_selectable.select_star()
	if event.is_action_pressed("combine"):
		GameStatus.verify_solution()

func _process(_delta):
	set_icons()
	set_hint_text()

func _on_area_2d_area_entered(area):
	contained_stars.append(area)
	
func _on_area_2d_area_exited(area):
	contained_stars.erase(area)
	
func check_current_selectable() -> Star:
	for star in contained_stars:
		if is_completely_inside(star): return star
	return null
	
func mark_selected():
	last_selectable = current_selectable
	current_selectable = check_current_selectable()
	
	if current_selectable == null and last_selectable != null:
		last_selectable.mark_selectable(false)
	
	if current_selectable != null and last_selectable == null:
		current_selectable.mark_selectable(true)

func _on_checkpoint_reached(level : int):
	set_lens(level+1)

func is_completely_inside(star: Area2D) -> bool:
	var telescope_center : Vector2 = area_2d.global_position
	var telescope_radius : float = collision_shape_2d.shape.radius
	
	var star_collision : CollisionShape2D = star.get_node("CollisionShape2D")
	var star_shape = star_collision.shape.size
	
	var points : Array = [
		Vector2(star_collision.global_position.x - star_shape.x/2, star_collision.global_position.y - star_shape.y/2),
		Vector2(star_collision.global_position.x - star_shape.x/2, star_collision.global_position.y + star_shape.y/2),
		Vector2(star_collision.global_position.x + star_shape.x/2, star_collision.global_position.y - star_shape.y/2),
		Vector2(star_collision.global_position.x + star_shape.x/2, star_collision.global_position.y + star_shape.y/2)
	]
	
	for p in points:
		if telescope_center.distance_to(p) > telescope_radius:
			return false
	
	return true

func set_lens(level : int):
	if level >= len(lens) or level < 0: return
	texture = lens[level]
	collision_shape_2d.shape.radius = lens_radius[level]

func set_hint_text():
	if GameStatus.current_puzzle: 
		hint_label.text = GameStatus.current_puzzle.hint_text
	else:
		hint_label.text = ""

func set_icons():
	var length = len(GameStatus.inventory)
	
	for i in range(length):
		icons[i].texture = GameStatus.inventory[i].sprite_mini
	
	for i in range(length, GameStatus.IMAGE_LIMIT):
		icons[i].texture = null
