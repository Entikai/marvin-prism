extends Node

var jump_high_obstacle: PackedScene = preload("res://_ProjectFiles/Game Objects/Obstacles/JumpHigh.tscn")

var player_color: String
var player_avoidance_type: String

var obstacle_color: String
var obstacle_type: String


func _ready() -> void:
	instance_new_obstacle(jump_high_obstacle)


func instance_new_obstacle(new_obstacle_type: PackedScene) -> void:
	var obstacle = new_obstacle_type.instance()
	obstacle.position = Vector2(1400, 380)
	add_child(obstacle)


func _on_Player_collided_with_obstacle(new_player_color, new_player_animation, new_obstacle_color, new_obstacle_type) -> void:
	player_color = new_player_color
	player_avoidance_type = new_player_animation
	obstacle_color = new_obstacle_color
	obstacle_type = new_obstacle_type
	print("Player: " + player_color + " " + player_avoidance_type + " Obstacle: " + obstacle_color + " " + obstacle_type)
