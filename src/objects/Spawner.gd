extends Node2D

const A1 = preload("res://src/objects/grupos/Grupo_A1.tscn")
const A2 = preload("res://src/objects/grupos/Grupo_A2.tscn")
const A3 = preload("res://src/objects/grupos/Grupo_A3.tscn")
const A4 = preload("res://src/objects/grupos/Grupo_A4.tscn")
const A5 = preload("res://src/objects/grupos/Grupo_A5.tscn")
const A6 = preload("res://src/objects/grupos/Grupo_A6.tscn")
const B1 = preload("res://src/objects/grupos/Grupo_B1.tscn")
const B2 = preload("res://src/objects/grupos/Grupo_B2.tscn")
const B3 = preload("res://src/objects/grupos/Grupo_B3.tscn")
const B4 = preload("res://src/objects/grupos/Grupo_B4.tscn")
const C1 = preload("res://src/objects/grupos/Grupo_C1.tscn")
const C2 = preload("res://src/objects/grupos/Grupo_C2.tscn")
const C3 = preload("res://src/objects/grupos/Grupo_C3.tscn")
const D1 = preload("res://src/objects/grupos/Grupo_D1.tscn")
const D2 = preload("res://src/objects/grupos/Grupo_D2.tscn")
const D3 = preload("res://src/objects/grupos/Grupo_D3.tscn")

const MED1 = preload("res://src/objects/grupos/Grupo_MED1.tscn")
const MED2 = preload("res://src/objects/grupos/Grupo_MED2.tscn")
const MED3 = preload("res://src/objects/grupos/Grupo_MED3.tscn")

#const grupos = [A1, A2, A3, A4, A5, A6, B1, B2, B3, B4, C1]
const grupo_a = [A1, A2, A3, A4, A5]
const grupo_b = [B1, B2, B3, B4]
const grupo_c = [C1, C2, C3]
const grupo_d = [D1, D2, D3]
const grupo_med = [MED1, MED2, MED3]

const MEDALLA_RATIO = 0.97

export var pilar_disabled: = false

var _time: = 4.0

func _process(delta: float) -> void:
	if not State.is_playing() || State.ending:
		return
		
	_time += delta
	if _time > 4.0:
		_time = 0
		
		var instance = random_instance()
		if instance != null:
			add_child(instance)	

func random_instance():
	var rf = randf()
#	print('randf: ', rf)
	var nivel = State.nivel()
	if rf > MEDALLA_RATIO && nivel < grupo_med.size() && nivel >= State.medallas():
		return grupo_med[State.nivel()].instance()
		
	print('nivel', State.nivel())
	var grupo = grupo_d
	match State.nivel():
		0: grupo = grupo_a
		1: grupo = grupo_b
		2: grupo = grupo_c
		
	var rng = randi() % grupo.size()
	#print('rng', rng)
	
	return grupo[rng].instance()
#	match rng:
#		0: return A1.instance()
#		1: return A2.instance()
#		2: return A3.instance()
#		3: return A4.instance()
#		4: return A5.instance()
#		5: return A6.instance()
#
#	return null
