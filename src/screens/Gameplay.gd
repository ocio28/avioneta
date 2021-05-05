extends Node2D

const mensaje = preload("res://src/gui/Mensaje.tscn")

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
	#var msg = Mensaje.new()
	var msg = mensaje.instance()
	print('msg', msg)
	$ForeGround.add_child(msg)


func _on_CreditosButton_button_down() -> void:
	$Creditos.visible = true
	$ControlEmpezar.visible = false


func _on_Volver_button_up() -> void:
	$Creditos.visible = false
	$ControlEmpezar.visible = true
