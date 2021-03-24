extends Label

func _ready() -> void:
	text = str(floor(State.playtime())) + "%"

func _process(delta: float) -> void:
	text = str(floor(State.playtime())) + "%"
