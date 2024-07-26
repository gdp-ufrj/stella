extends Area2D

@export var constellation : Constellation

@onready var sprite_2d : Sprite2D = $Icon

func _ready():
	sprite_2d.texture = constellation.sprite_stars

func select_star():
	if not GameStatus.add_new_image(constellation): return
	
	sprite_2d.texture = constellation.sprite_full
