extends Control
class_name Mensaje

const redIcon = preload("res://assets/resources/sheet.planeRed1.atlastex")
const greenIcon = preload("res://assets/resources/sheet.planeGreen1.atlastex")
const yellowIcon = preload("res://assets/resources/sheet.planeYellow1.atlastex")
const blueIcon = preload("res://assets/resources/sheet.planeBlue1.atlastex")
const avionetas = [redIcon, greenIcon, blueIcon, yellowIcon]

const mensajes: = [
	[
		'Weon morimos altiro',
		'Tamos agarrando ritmo',
		'Hay que ponerle weno, demas llegamos',
		'Yapo tamo ahi!!!!',
		'Esta wea ya le queda poco',
	],
	[
		'Pero que boludes',
		'Andáte a la mierda avioneta',
		'Estamos en la b :(',
		'Esto sha es... demaciado',
		'Sos lo mas grande!!!!',
	],
	[
		'A la verga',
		'Esta chingon cabron!',
		'Guadalupe yo que se me escuchas...',
		'Anda si esta bien cabron',
		'Esto esta mamado',
	],
	[
		':\'(',
		'Ay que dolor que dolor!',
		'Ya vamo perdiendo......',
		'En la b',
		'Lo tenia!!! lo tenia!!!',
	],
]


onready var icon = $Panel/Icon
onready var label = $Panel/Label

func _ready() -> void:
	var msg = mensajes[State.indice_avioneta()][State.nivel()]
	label.text = msg
	icon.texture = avionetas[State.indice_avioneta()]
