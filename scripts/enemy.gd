class_name Enemy

extends CharacterBody2D

@onready var healthbar: TextureProgressBar = $EnemyHealthbar
@onready var animation: AnimatedSprite2D = $animation

var health: float
var max_health: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthbar.min_value = 0.
	healthbar.max_value = 100.
	healthbar.value = healthbar.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func take_damage(amount: float) -> void:
	pass


func _update_healthbar() -> void:
	healthbar.value = (health * 100.) / max_health

func _die() -> void:
	pass
