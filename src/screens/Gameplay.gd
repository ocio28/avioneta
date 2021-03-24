extends Node2D


var _reseting = false
var _reset_time = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	State.new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _reseting:
		_reset_time += delta
		if _reset_time > 2:
			_reseting = false
			get_tree().reload_current_scene()

func _on_Avioneta_destruido() -> void:
	_reseting = true
	_reset_time = 0
	$Musica.playing = false
	State.contar_muerte()
	State.fijar_pb()
