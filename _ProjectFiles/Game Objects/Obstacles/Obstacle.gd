extends Area2D

signal collided

onready var all_sprite_colors = $SpriteColors.get_children() #Array of type Node2D

export var obstacle_type: String = "Obstacle type not specifieid! "
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


func _on_Obstacle_body_entered(body: Node) -> void:
	emit_signal("collided", obstacle_color, obstacle_type)
