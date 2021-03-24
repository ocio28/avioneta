extends Node2D

func _ready() -> void:
	AudioServer.set_bus_mute(0, !State.audio)

func _process(delta: float) -> void:
	AudioServer.set_bus_mute(0, !State.audio)

func play_estrella():
	$Estrella.play()
	
func play_medalla():
	$Medalla.play()

func play_explosion():
	$Explosion.play()

func play_jump():
	$Jump.play()

func toggle():
	State.audio = !State.audio

func is_mute():
	return !State.audio
