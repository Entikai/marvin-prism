extends AnimationPlayer


func set_animation(new_animation: String):
	match new_animation:
		"jump_high":
			jump_high()
		"jump_mid":
			jump_mid()
		"slide":
			slide()


func jump_high() -> void:
	print("high")

func jump_mid() -> void:
	print("mid")

func slide() -> void:
	print("slide")
