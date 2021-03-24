extends HBoxContainer

func _ready() -> void:
	medallas()

func _process(delta: float) -> void:
	medallas()

func medallas():
	var medallas = State.medallas()
	$Bronce.visible = medallas > 0
	$Plata.visible = medallas > 1
	$Oro.visible = medallas > 2
