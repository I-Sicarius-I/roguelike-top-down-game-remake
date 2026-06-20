extends Enemy

@onready var damage_cooldown: Timer = $DamageCooldown
@onready var area_cooldown: Timer = $AreaCooldown

var state: String = "normal"
var health_change_amount: float = 25.
var in_area: bool = false
var in_cooldown: bool = true
var target: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_health = 150.
	health = max_health
	super._ready()

func _process(_delta: float) -> void:
	heal_or_damage(target)

func take_damage(amount: float) -> void:
	

	_switch()
	
	health -= amount
	
	_update_healthbar()
	
	
	animation.play("damage_" + state)
	
	if health <= 0.:
		_die()
	
	# debug
	print("%s: [%.2f / %.2f]" % [self.name, health, max_health])
	damage_cooldown.start()
	
func _switch() -> void:
	state = "sad"
	animation.play("idle_" + state)
	
	
func _die() -> void:
	health = max_health
	
	_update_healthbar()


func _on_damage_cooldown_timeout() -> void:
	state = "normal"
	animation.play("idle_" + state)
	damage_cooldown.stop() # Replace with function body.
	
func heal_or_damage(body: Node2D) -> void:
	if not in_cooldown and target:
		if state == "normal":
			body.heal(health_change_amount)
		elif state == "sad":
			body.take_damage(health_change_amount)
		
		in_cooldown = true
		area_cooldown.start()


func _on_damage_heal_area_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		print(body.name)
		in_area = true
		target = body
		in_cooldown = false
		area_cooldown.start()
		

func _on_damage_heal_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_area = false
		target = null
		area_cooldown.stop()
	
func _on_area_cooldown_timeout() -> void:
	in_cooldown = false
