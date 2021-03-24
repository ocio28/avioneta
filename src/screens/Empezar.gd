extends Control

func _ready() -> void:
	visible = not State.is_playing()

func _process(delta: float) -> void:
	visible = not State.is_playing()
