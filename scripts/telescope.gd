extends TextureRect

@onready var area_2d : = get_node("Area2D") as Area2D
@onready var collision_shape_2d : = get_node("Area2D/CollisionShape2D") as CollisionShape2D
var contained_stars : Array = []

func _process(delta):
	if Input.is_action_just_pressed("select"):
		for star in contained_stars:
			if not is_completely_inside(star): continue
			star.select_star()

func _on_area_2d_area_entered(area):
	contained_stars.append(area)
	
func _on_area_2d_area_exited(area):
	contained_stars.erase(area)

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
