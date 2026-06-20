class_name AbilityItem

extends Item

const COOLDOWN_TIME = 3.
const INVISIBILITY = 0.75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _use_ability(body: Node2D) -> void:
	if body.name == "Player" and Input.is_action_pressed("use_ability"):
		pass
