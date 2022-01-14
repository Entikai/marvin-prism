extends Node




func _on_Player_state_changed(current_player_color: String, current_player_animation: String ) -> void:
	print(current_player_color + " " + current_player_animation)
