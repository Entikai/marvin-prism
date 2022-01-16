extends Node


func _on_Player_state_changed(current_player_color: String, current_player_animation: String ) -> void:
	#print("Player: " + current_player_color + " " + current_player_animation)
	pass


func _on_ObstacleBase_collided(obstacle_color, obstacle_type) -> void:
	print("Main messaged by obstacle: " + obstacle_color, obstacle_type)
