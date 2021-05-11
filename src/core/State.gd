extends Node

const FILE_NAME = "user://avioneta-data.json"
const AVIONETAS = [{
	disponible = true,
	precio = 0
}, {
	disponible = false,
	precio = 100
},  {
	disponible = false,
	precio = 300
},  {
	disponible = false,
	precio = 400
}]


var ultimo_record: = 0
var player_alive: = true
var ending: = false
var audio: = true
var avionetas: = AVIONETAS.duplicate(true)

var _avioneta: = 0
var _estrellas: = 0
var _medallas: = 0
var _nivel: = 0
var _muertes: = 0

var _playtime: = 0.0
var _playing: = false

var _level_timeout: = 0.0

func _ready() -> void:
	game_load()


func _process(delta: float) -> void:
	if not _playing || not player_alive || ending:
		return
		
	_playtime += delta
	_level_timeout += delta
	if _level_timeout > (20.0 + _nivel * 2):
		_level_timeout = 0.0
		level_up()

		
	if _playtime > 100:
		ending = true
		fijar_pb()
		
func avioneta_disponible():
#	print(avionetas, indice_avioneta())
	return avionetas[indice_avioneta()].disponible
	
func avioneta_precio():
	return avionetas[indice_avioneta()].precio
		
func comprar_avioneta():
	avionetas[_avioneta].disponible = true
	_estrellas -= avionetas[_avioneta].precio
	game_save()
	
func fijar_avioneta(v):
	_avioneta += v
	if _avioneta < 0:
		_avioneta = avionetas.size() - 1
		
	if _avioneta >= avionetas.size():
		_avioneta = 0
	
func indice_avioneta():
	return _avioneta
	
func fijar_pb():
	if _playtime > ultimo_record:
		ultimo_record = _playtime
		
	game_save()

func playtime():
	return _playtime

func new_game():
	ending = false
	player_alive = true
	_nivel = 0
	_playing = false
	_level_timeout = 0

func is_playing():
	return _playing
	
func set_playing():
	_playing = true
	_playtime = 0
	
func stop_playing():
	_playing = false

func level_up():
	_nivel += 1
	AudioFx.play_medalla()
	
func nivel():
	return _nivel

func collect_estrella():
	AudioFx.play_estrella()
	_estrellas += 1

func estrellas():
	return _estrellas

func collect_medalla():
	AudioFx.play_medalla()
	_medallas += 1
	
func medallas():
	return _medallas

func muertes():
	return _muertes
	
func contar_muerte():
	_muertes += 1


func game_save():
	var data = {
		ultimo_record = ultimo_record,
		estrellas = _estrellas,
		medallas = _medallas,
		config_audio = audio,
		avionetas = avionetas,
		muertes = _muertes
	}
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(data))
	file.close()

func game_load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			ultimo_record = data.ultimo_record
			_estrellas = data.estrellas
			_medallas = data.medallas
			audio = data.config_audio
			avionetas = data.avionetas
			_muertes = data.muertes
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")

func eliminar_gamesave():
	AudioFx.play_medalla()
	var dir = Directory.new()
	dir.remove(FILE_NAME)
	ultimo_record = 0
	_estrellas = 0
	_medallas = 0
	avionetas = AVIONETAS.duplicate(true)
	_avioneta = 0
	_muertes = 0
