extends Area2D

var healing_amount: float = 20.




func _on_body_entered(body: Node2D) -> void:
	if body.name.to_lower() == "player":
		body.heal(healing_amount)
		queue_free()
