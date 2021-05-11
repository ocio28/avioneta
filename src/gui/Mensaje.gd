extends Control
class_name Mensaje

const redIcon = preload("res://assets/resources/sheet.planeRed1.atlastex")
const greenIcon = preload("res://assets/resources/sheet.planeGreen1.atlastex")
const yellowIcon = preload("res://assets/resources/sheet.planeYellow1.atlastex")
const blueIcon = preload("res://assets/resources/sheet.planeBlue1.atlastex")
const avionetas = [redIcon, greenIcon, blueIcon, yellowIcon]

const mensajes: = [
	[
		'Alo me escuchan? *Cambio',
		'Parece que estamos en el lugar correcto',
		'Perdimos la comunicación despues de una tormenta',
		'Parece que falta muy poco!',
		'La caverna esta justo adelante!'
	],
	[
		'Alo El motor esta fallando *Cambio',
		'Esto se va a poner feo...',
		'*Cambio parece que estamos entrando a una caverna congelada *Cambio',
		'Nadie habia llegado antes tan lejos como nosotros',
		'El tesoro!! La tenemos!!!'
	],
	[
		'No hay caso, no puedo comunicarme',
		'Voy sólo al abismo!!',
		'*Cambio alo?, creo que estoy recibiendo una señal!',
		'Madre de dios... que.. chingawat',
		'Olle y despues como volvemos? el motor no da mas'
	],
	[
		'Creo que escuche algo en la radio',
		'Alo *Cambio *Cambio alo alo!',
		'Es cierta la leyenda de la caverna cavernicola!',
		'Asi como dicen, somos los primeros, la mejor parte!',
		'Estamos todos comunicados? quien falta?'
	]
]

onready var icon = $Panel/Icon
onready var label = $Panel/Label

func _ready() -> void:
	var msg = mensajes[State.indice_avioneta()][State.nivel()]
	label.text = msg
	icon.texture = avionetas[State.indice_avioneta()]
