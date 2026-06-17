class_name Bullet

extends Node2D

var speed: float
var damage: float

# function variable for dealing damage
var deal_damage: Callable

# function variable for flying 
var flight: Callable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	flight.call(self, speed, delta)


func _on_hitbox_area_body_entered(body: Node2D) -> void:
	await deal_damage.call(damage, body)
	queue_free()
