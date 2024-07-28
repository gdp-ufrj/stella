extends Area2D

@export var constellation : Constellation
@export var size : STAR_SIZES

@onready var sprite_2d : Sprite2D = $Icon
@onready var collision_shape : CollisionShape2D = $CollisionShape2D

enum STAR_SIZES {
	SMALLEST,
	SMALL,
	MEDIUM,
	LARGE,
	LARGEST,
}

func _ready():
	sprite_2d.texture = constellation.sprite_stars
	init_star_size()

func select_star():
	if not GameStatus.add_new_image(constellation): return
	sprite_2d.texture = constellation.sprite_full

func init_star_size():
	match size:
		STAR_SIZES.SMALLEST:
			collision_shape.shape.size = Vector2(45, 45)
		STAR_SIZES.SMALL:
			collision_shape.shape.size = Vector2(65, 65)
			sprite_2d.scale = Vector2(1.5, 1.5)
		STAR_SIZES.MEDIUM:
			collision_shape.shape.size = Vector2(90, 90)
			sprite_2d.scale = Vector2(2, 2)
		STAR_SIZES.LARGE:
			collision_shape.shape.size = Vector2(120, 120)
			sprite_2d.scale = Vector2(2.5, 2.5)
		STAR_SIZES.LARGEST:
			collision_shape.shape.size = Vector2(150, 150)
			sprite_2d.scale = Vector2(3, 3)
