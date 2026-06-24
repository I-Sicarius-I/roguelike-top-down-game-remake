class_name MagazineItem

extends Item

@onready var reload_timer: Timer = $ReloadTimer

signal update_ammo(ammo: int, max_ammo: int)

var is_empty: bool = false
var reload_time: float = 2.0
var max_amount: int = 8
var curr_amount: int = max_amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func update_magazine() -> void:
	curr_amount -= 1
	
	emit_signal("update_ammo", curr_amount, max_amount)
	
	if curr_amount == 0:
		is_empty = true
		reload_timer.wait_time = reload_time
		reload_timer.start()
	
func _on_reload() -> void:
	is_empty = false
	curr_amount = max_amount
	emit_signal("update_ammo", curr_amount, max_amount)

func _on_reload_timer_timeout() -> void:
	_on_reload() # Replace with function body.
