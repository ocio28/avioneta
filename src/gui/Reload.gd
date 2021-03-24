extends Button


func _on_Reload_button_up() -> void:
	get_tree().reload_current_scene()


func _on_Salir_button_up() -> void:
	get_tree().quit(0)
