extends Node2D

const redIcon = preload("res://assets/resources/sheet.planeRed1.atlastex")
const greenIcon = preload("res://assets/resources/sheet.planeGreen1.atlastex")
const yellowIcon = preload("res://assets/resources/sheet.planeYellow1.atlastex")
const blueIcon = preload("res://assets/resources/sheet.planeBlue1.atlastex")
const avionetas = [redIcon, greenIcon, blueIcon, yellowIcon]


onready var label = $Control/NinePatchRect/HBoxContainer2/Label
onready var icon =  $Control/NinePatchRect/HBoxContainer2/Icon

const mensajes =  [
	'Wiiiiiiiiiii llegamos :)',
	'Despues veremos como volvemos, talvez en otro juego',
	'Ya estamos vamos a por el tesoro cavernicola!',
	'Parece que llegamos todos, camaradas vamos a explorar'
]

func _process(delta: float) -> void:
	if position.x > 0 && State.ending:
		position.x -= 200 * delta
		
	$Control.visible = position.x <= 0
	label.text = mensajes[State.indice_avioneta()]
	icon.texture = avionetas[State.indice_avioneta()]
