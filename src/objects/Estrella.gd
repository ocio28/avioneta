extends Node2D


func _on_Body_area_entered(area: Area2D) -> void:
	State.collect_estrella()
	queue_free()
