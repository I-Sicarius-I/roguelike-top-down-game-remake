class_name FlightItem

extends Item


const SPEED = 300.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_bullet_flight_properties(bullet: Bullet) -> Bullet:
	
	bullet.speed = SPEED
	bullet.flight = flight
	
	
	return bullet

func flight(bullet: Bullet, speed: float, delta: float) -> void:
	bullet.position += speed * delta * bullet.transform.x
