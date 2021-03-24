extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(progreso()) + "%"

func progreso():
	var disponibles: = 0
	for v in State.avionetas:
		if v.disponible && v.precio > 0:
			disponibles += 1
	
	var avionetas: = float(disponibles) / (State.avionetas.size() - 1)
	var medallas: = float(State.medallas()) / 3
	var record: = float(State.ultimo_record) / 100
	var total = ((record + medallas + avionetas) / 3) * 100
	
	return floor(total)
