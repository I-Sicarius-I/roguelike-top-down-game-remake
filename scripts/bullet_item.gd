class_name BulletItem

extends Item

const BULLET = preload("res://scenes/bullet.tscn")
const DAMAGE = 25.



func create_bullet() -> Bullet:
	var bullet_instance = BULLET.instantiate()
	
	bullet_instance.damage = DAMAGE
	bullet_instance.deal_damage = _deal_damage
	
	return bullet_instance


func _deal_damage(amount: float, body: Node2D) -> void:
	var lower_name = body.name.to_lower()
	
	if lower_name.contains("enemy"):
		body.take_damage(amount)
