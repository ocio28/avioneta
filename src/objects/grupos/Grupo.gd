extends Node2D

func _process(delta: float) -> void:
	position.x -= 400 * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
