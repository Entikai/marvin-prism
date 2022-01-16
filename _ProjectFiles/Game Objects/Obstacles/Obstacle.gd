extends KinematicBody2D

onready var all_sprite_colors = $SpriteColors.get_children() #Array of type Node2D

var obstacle_type: String = "Obstacle type not specifieid! "
var obstacle_color: String = "Obstacle color not specified! "

func _ready() -> void:
	hide_all_colors()
	reveal_random_color() 

func hide_all_colors():
	for sprite in all_sprite_colors:
		sprite.visible = false


func reveal_random_color() -> void:
	randomize()
	var random_sprite_color = all_sprite_colors[randi() % all_sprite_colors.size()]
	random_sprite_color.visible = true
	obstacle_color = random_sprite_color.name


#temp movement
func _process(_delta: float) -> void:
	move_and_slide(Vector2(-1,0) * 200)
	remove_if_off_screen()
	

func get_obstacle_color() -> String:
	return obstacle_color

func get_obstacle_type() -> String:
	return obstacle_type

func remove_if_off_screen() ->void:
	if position.x <= -300:
		queue_free()
