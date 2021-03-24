extends Control

const roja = preload("res://assets/resources/sheet.planeRed1.atlastex")
const verde = preload("res://assets/resources/sheet.planeGreen1.atlastex")
const celeste = preload("res://assets/resources/sheet.planeBlue1.atlastex")
const amarilla = preload("res://assets/resources/sheet.planeYellow1.atlastex")


const avionetas = [roja, verde, celeste, amarilla]

onready var sprite: = $Panel/Container/Avioneta
onready var lock: = $Panel/Container/Avioneta/Lock
onready var label: = $Panel/Container/MarginContainer/HBoxContainer/Comprar/HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.texture = avionetas[State.indice_avioneta()]
	lock.visible = !State.avioneta_disponible()
	label.text = str(State.avioneta_precio())


func _on_Izquierda_button_up() -> void:
	State.fijar_avioneta(-1)


func _on_Comprar_button_up() -> void:
	if State.estrellas() >= State.avioneta_precio() && !State.avioneta_disponible():
		State.comprar_avioneta()
		AudioFx.play_medalla()


func _on_Derecha_button_up() -> void:
	State.fijar_avioneta(1)
