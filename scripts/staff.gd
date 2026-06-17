extends Node2D

@onready var items: Node2D = $items
@onready var staff_sprite: Sprite2D = $staff_sprite

# Preloading starting modules
var start_bullet_item = preload("res://scenes/bullet_item.tscn")
var start_flight_item = preload("res://scenes/flight_item.tscn")
var start_shooting_item = preload("res://scenes/shooting_item.tscn")
var start_magazine_item = preload("res://scenes/magazine_item.tscn")
var start_ability_item = preload("res://scenes/ability_item.tscn")


var module_list: Dictionary = {
	"bullet": null,
	"flight": null,
	"shooting": null,
	"magazine": null,
	"ability": null,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bul_item_inst = start_bullet_item.instantiate()
	var fl_item_inst = start_flight_item.instantiate()
	var shoot_item_inst = start_shooting_item.instantiate()
	var mag_item_inst = start_magazine_item.instantiate()
	var abl_item_inst = start_ability_item.instantiate()
	
	module_list["bullet"] = bul_item_inst
	module_list["flight"] = fl_item_inst
	module_list["shooting"] = shoot_item_inst
	module_list["magazine"] = mag_item_inst
	module_list["ability"] = abl_item_inst
	
	for item in module_list.values():
		items.call_deferred("add_child", item)



func _process(_delta: float) -> void:
	_look_at_mouse()
	_use_gun()

func _look_at_mouse() -> void:
	
	look_at(get_global_mouse_position())
	
	rotation = wrap(rotation, -PI, PI)
	
	if rotation > PI / 2. or rotation < -PI /2.:
		scale.y = -1
	else:
		scale.y = 1
	
func _use_gun() -> void:
	if Input.is_action_pressed("attack"):
		module_list["shooting"].shoot(module_list["bullet"], module_list["flight"], module_list["magazine"])
	
	
