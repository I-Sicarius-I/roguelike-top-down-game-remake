extends Node2D

@onready var hud: CanvasLayer = $Hud

var level_root: Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_root = get_node("level_root")
	
	var player = level_root.get_node("Player")
	hud.set_up_hud(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
