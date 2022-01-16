extends Area2D

signal collided_with_obstacle

onready var all_sprite_variations = $SpriteColors.get_children()

onready var blue_node: Node2D = $SpriteColors/Blue
onready var green_node: Node2D = $SpriteColors/Green
onready var red_node: Node2D = $SpriteColors/Red
onready var purple_node: Node2D = $SpriteColors/Purple


func _ready() -> void:
	start_all_animations()
	enable_only_one_sprite(blue_node.name)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("blue_color_switch"):
		enable_only_one_sprite(blue_node.name)
	elif event.is_action_pressed("green_color_switch"):
		enable_only_one_sprite(green_node.name)
	elif event.is_action_pressed("red_color_switch"):
		enable_only_one_sprite(red_node.name)
	elif event.is_action_pressed("purple_color_switch"):
		enable_only_one_sprite(purple_node.name)
	
	if event.is_action_pressed("jump_high"):
		play_jump_and_slide_animation("jump_high")
	elif event.is_action_pressed("jump_mid"):
		play_jump_and_slide_animation("jump_mid")
	elif event.is_action_pressed("slide"):
		play_jump_and_slide_animation("slide")


func start_all_animations():
	for sprite in all_sprite_variations:
		sprite.play()


func enable_only_one_sprite(color: String) -> void: #INPUT READ
	if get_active_sprite().get_animation() == "run":
		for sprite in all_sprite_variations:
			if sprite.name == color:
				sprite.visible = true
			else:
				sprite.visible = false


func get_active_sprite() -> Node2D:
	var active_sprite: Node2D
	for sprite in all_sprite_variations:
		if sprite.visible == true:
			active_sprite = sprite
	return active_sprite


func play_jump_and_slide_animation(animation_name: String) -> void: #INPUT READ
	var active_sprite = get_active_sprite()
	if active_sprite != null and active_sprite.get_animation() == "run":
		active_sprite.play(animation_name)


func _on_Blue_animation_finished() -> void:
	blue_node.play("run")


func _on_Green_animation_finished() -> void:
	green_node.play("run")


func _on_Red_animation_finished() -> void:
	red_node.play("run")


func _on_Purple_animation_finished() -> void:
	purple_node.play("run")



func get_current_player_color() -> String:
	var active_sprite: Node2D
	for sprite in all_sprite_variations:
		if sprite.visible == true:
			active_sprite = sprite
	var current_player_color: String = active_sprite.name
	return current_player_color


func get_current_player_animation() -> String:
	var active_sprite: Node2D
	for sprite in all_sprite_variations:
		if sprite.visible == true:
			active_sprite = sprite
	var current_player_animation: String = active_sprite.get_animation()
	return current_player_animation


func _on_Player_body_entered(body: Node) -> void:
	var player_color: String = get_current_player_color()
	var player_animation_type: String = get_current_player_animation()
	var obstacle_color: String = body.get_obstacle_color()
	var obstacle_type: String = body.get_obstacle_type()
	emit_signal("collided_with_obstacle", player_color, player_animation_type, obstacle_color, obstacle_type)

