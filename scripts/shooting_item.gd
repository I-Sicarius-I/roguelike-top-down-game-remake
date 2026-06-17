class_name ShootingItem

extends Item

@onready var firerate_timer: Timer = $Firerate

const COOLDOWN = 0.5

var is_on_cooldown: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func shoot(bullet_item: BulletItem, flight_item: FlightItem, magazine: MagazineItem) -> void:
	
	if Input.is_action_pressed("attack") and not is_on_cooldown and not magazine.is_empty:
		var bullet_instance = bullet_item.create_bullet()
		
		var root = get_tree().root
		var staff: Node2D = get_parent().get_parent()
		var marker: Node2D = staff.get_node("bullet_spawn_marker")
		
		bullet_instance = flight_item.set_bullet_flight_properties(bullet_instance)
		
		bullet_instance.global_position = marker.global_position 
		bullet_instance.rotation = staff.rotation
		
		root.call_deferred("add_child", bullet_instance)
		
		magazine.update_magazine()
		
		firerate_timer.wait_time = 0.5
		is_on_cooldown = true
		firerate_timer.start()
	
	


func _on_firerate_timeout() -> void:
	is_on_cooldown = false # Replace with function body.
