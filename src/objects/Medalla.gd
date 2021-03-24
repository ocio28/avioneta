extends Node2D

const PlataSprite = preload("res://assets/resources/sheet.medalSilver.atlastex")
const OroSprite = preload("res://assets/resources/sheet.medalGold.atlastex")


func _process(delta: float) -> void:
	if State.medallas() == 1:
		$Sprite.texture = PlataSprite
	elif State.medallas() == 2:
		$Sprite.texture = OroSprite
		
	if State.medallas() > 2:
		death()
	
func _on_Body_area_entered(area: Area2D) -> void:
	State.collect_medalla()
	death()

func death():
	queue_free()
