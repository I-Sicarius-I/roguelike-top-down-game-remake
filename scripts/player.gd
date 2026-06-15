extends CharacterBody2D

@onready var player_animation: AnimatedSprite2D = $PlayerAnimation

const SPEED = 300.0
var last_direction: Vector2 = Vector2.DOWN


func _physics_process(delta: float) -> void:
	_process_looking()
	_process_movement()
	_process_animation()
	
func _process_movement() -> void:
	
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		
		velocity = direction * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func _process_animation() -> void:
	if velocity != Vector2.ZERO:
		_play_animation("run", last_direction)
	else:
		_play_animation("idle", last_direction)

func _process_looking() -> void:
	var rot = get_angle_to(get_global_mouse_position())
	
	#print(rot)
	if rot >= (-3*PI / 4.) and rot < (-PI / 4.):
		last_direction = Vector2.UP
	elif rot >= (-PI / 4.) and rot < (PI / 4.):
		last_direction = Vector2.LEFT
	elif rot < (3*PI / 4.) and rot >= (PI / 4.):
		last_direction = Vector2.DOWN
	else: 
		last_direction = Vector2.RIGHT
	
func _play_animation(prefix: String, dir: Vector2) -> void:
	
	if dir.x != 0:
		player_animation.flip_h = dir.x > 0
		player_animation.play(prefix + "_right")
	elif dir.y > 0: 
		player_animation.play(prefix + "_down")
	elif dir.y < 0:
		player_animation.play(prefix + "_up")

	
