extends Node

var jump_high_obstacle: PackedScene = preload("res://_ProjectFiles/Game Objects/Obstacles/JumpHigh.tscn")
var jump_mid_obstacle: PackedScene = preload("res://_ProjectFiles/Game Objects/Obstacles/JumpMid.tscn")
var slide_obstacle: PackedScene = preload("res://_ProjectFiles/Game Objects/Obstacles/Slide.tscn")
var obstacles = [slide_obstacle, jump_mid_obstacle, jump_high_obstacle]

var last_obstacle_type: int = -1


func _ready() -> void:
	randomize()

func _on_Player_collided_with_obstacle(player_color, player_avoidance_type, obstacle_color, obstacle_type) -> void:
	is_player_dead(player_color, player_avoidance_type, obstacle_color, obstacle_type)


func is_player_dead(player_color, player_avoidance_type, obstacle_color, obstacle_type) -> void:
	if player_color != obstacle_color or player_avoidance_type != obstacle_type:
		get_tree().reload_current_scene()



func _on_ObstacleSpawnCooldown_timeout() -> void:
	instance_new_obstacle(random_obstacle())


func instance_new_obstacle(new_obstacle_type: PackedScene) -> void:
	var initial_spawn_position = Vector2(1400, 370)
	var obstacle = new_obstacle_type.instance()
	obstacle.position = initial_spawn_position
	add_child(obstacle)

func random_obstacle():
	var rng: int = generate_random_number()
	while rng == last_obstacle_type:
		rng = generate_random_number()
	last_obstacle_type = rng
	return obstacles[rng]


func generate_random_number():
	return randi() % obstacles.size()
