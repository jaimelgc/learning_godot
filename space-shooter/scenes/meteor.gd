extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://assets/PNG/Meteors/meteorGrey_big" + str(rng.randi_range(1, 4)) + ".png"
	$MeteorSprite.texture = load(path)
	
	var screen_width = get_viewport().get_visible_rect().size[0]
	var rand_x = rng.randi_range(0, screen_width)
	var rand_y = rng.randi_range(-150, -50)
	position = Vector2(rand_x, rand_y)
	
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(0, 3)
	
func _process(delta: float):
	position += Vector2(direction_x, 1) * speed * delta
	rotation_degrees += rotation_speed * speed * delta

func _on_body_entered(body: Node2D) -> void:
	pass
	
