extends Button

const encendido = preload("res://assets/resources/icons/MusicOn.tres")
const apagado = preload("res://assets/resources/icons/MusicOff.tres")


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if AudioFx.is_mute():
		icon = apagado
	else:
		icon = encendido


func _on_ToggleAudio_button_up() -> void:
	AudioFx.toggle()
