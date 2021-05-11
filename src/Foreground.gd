extends ParallaxLayer

const Ground2 = preload("res://assets/resources/sheet.groundDirt.atlastex")
const Ground3 = preload("res://assets/resources/sheet.groundRock.atlastex")
const Ground4 = preload("res://assets/resources/sheet.groundSnow.atlastex")
const Ground5 = preload("res://assets/resources/sheet.groundIce.atlastex")

export var speed: = -400.0

func _process(delta: float) -> void:
	if not State.is_playing() || not State.player_alive:
		return
		
	motion_offset.x += speed * delta

	match State.nivel():
		1: texturas(Ground2)
		2: texturas(Ground3)
		3: texturas(Ground4)
		4: texturas(Ground5)

func texturas(texture):
	for child in get_children():
		child.texture = texture
