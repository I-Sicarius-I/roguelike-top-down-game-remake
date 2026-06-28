extends Area2D

var money_amount: int = 10
@onready var spin_timer: Timer = $SpinTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	spin_timer.start()
	

func _play_animation() -> void:
	animated_sprite_2d.play("spinning")
	await animated_sprite_2d.animation_finished
	

	animated_sprite_2d.play("idle")

	spin_timer.start()


func _on_spin_timer_timeout() -> void:
	_play_animation()



func _on_body_entered(body: Node2D) -> void:
	
	if body.name.to_lower() == "player":
		body.update_wallet(money_amount)
		
	queue_free()
