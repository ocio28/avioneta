extends Node2D

const Pilar2 = preload("res://assets/resources/sheet.rock.atlastex")
const Pilar3 = preload("res://assets/resources/sheet.rockSnow.atlastex")
const Pilar4 = preload("res://assets/resources/sheet.rockIce.atlastex")


func _process(delta: float) -> void:
	match State.nivel():
		1: $Sprite.texture = Pilar2
		2: $Sprite.texture = Pilar2
		3: $Sprite.texture = Pilar3
		
	if State.nivel() > 3:
		$Sprite.texture = Pilar4
