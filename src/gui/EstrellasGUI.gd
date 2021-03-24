extends HBoxContainer


onready var label: = $Label


func _process(delta: float) -> void:
	label.text = str(State.estrellas())
