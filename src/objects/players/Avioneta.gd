extends Node2D

signal destruido

const roja = preload("res://assets/resources/sheet.planeRed1.atlastex")
const verde = preload("res://assets/resources/sheet.planeGreen1.atlastex")
const celeste = preload("res://assets/resources/sheet.planeBlue1.atlastex")
const amarilla = preload("res://assets/resources/sheet.planeYellow1.atlastex")

const avionetas = [roja, verde, celeste, amarilla]
onready var sprite: = $Sprite


const MAX_ANGLE = deg2rad(35)
const GRAVEDAD: = 1300
const POWER:= 600
const LIMIT = -300

var _velocity = 0


func _ready() -> void:
	State.player_alive = true
	sprite.visible = false
	
func _on_Body_area_entered(area: Area2D) -> void:
	if area.collision_layer == 2:
		death()
		
func _input(event):
	if event is InputEventScreenTouch && State.is_playing():
		if event.is_pressed() && event.position.y < 668:
			accion(1)
			
func _process(delta: float) -> void:
	sprite.texture = avionetas[State.indice_avioneta()]
	if not State.is_playing():
		return
		
	sprite.visible = true
	_velocity += GRAVEDAD * delta
	
	if Input.is_action_just_pressed("tap"):
		accion(1)
#	
	position.y += _velocity * delta
	sprite.rotation = lerp_angle(-MAX_ANGLE, MAX_ANGLE, (_velocity / 10) * delta) + MAX_ANGLE / 2
	
	if position.y < 64 || position.y > 620:
		death()
		
	if State.ending:
		position.x += 100 * delta

func accion(delta):
	_velocity = -POWER * delta
	AudioFx.play_jump()

func death():
	State.player_alive = false
	if not is_queued_for_deletion():
		emit_signal("destruido")
		AudioFx.play_explosion()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
