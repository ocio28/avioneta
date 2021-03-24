extends NinePatchRect

func _on_LinkButton_button_up() -> void:
	if State.avioneta_disponible():
		State.set_playing()
