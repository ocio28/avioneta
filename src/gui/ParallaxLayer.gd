extends ParallaxLayer

const Ground2 = preload("res://assets/resources/sheet.groundDirt.atlastex")

export var speed: = -30.0

func _process(delta: float) -> void:
	if not State.is_playing():
		return
		
	motion_offset.x += speed * delta
