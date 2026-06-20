extends Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_health = 150.
	health = max_health
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _die() -> void:
	health = max_health
	
	_update_healthbar()
