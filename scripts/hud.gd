extends CanvasLayer

@onready var hearts_container: HBoxContainer = $VBoxContainer/HeartsContainer
@onready var ammo_container: HBoxContainer = $VBoxContainer/AmmoContainer
@onready var coin_hud: HBoxContainer = $coin_hud


# Health
const HEART_SIZE: int = 20

const HEART_FULL = preload("res://assets/ui/heartFull.png")
const HEART_HALF = preload("res://assets/ui/heartHalf.png")
const HEART_EMPTY = preload("res://assets/ui/heartEmpty.png")

# Magazine
const BULLET = preload("res://assets/ui/ammo_full.png")
const EMPTY = preload("res://assets/ui/ammo_empty.png")

var player: CharacterBody2D
var magazine: MagazineItem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_up_hud(player: Node2D) -> void:
	
	self.player = player
	
	if player:
		player.update_health.connect(_on_update_health)
		_on_update_health(player.health, player.max_health)
		magazine = player.get_node("staff").module_list["magazine"]
		magazine.update_ammo.connect(_on_update_ammo)
		_on_update_ammo(magazine.curr_amount, magazine.max_amount)
		
		coin_hud.set_up_hud(player)
	
	
func _on_update_health(health: float, max_health: float) -> void:
	
	var hearts_len = len(hearts_container.get_children())
	var num_of_hearts = int(max_health / HEART_SIZE)
	
	if hearts_len < num_of_hearts:		
		for i in (num_of_hearts - hearts_len):
			var textRect = TextureRect.new()
			textRect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
			textRect.stretch_mode = TextureRect.STRETCH_KEEP
			hearts_container.add_child(textRect)
			
	var hearts = hearts_container.get_children()
	
	var full: int = health / HEART_SIZE
	var half: int = 1 if int(health) % HEART_SIZE > 0 else 0
	var empty: int = num_of_hearts - full - half
	
	for i in full:
		hearts[i].texture = HEART_FULL
		
	if half:
		hearts[full].texture = HEART_HALF
	
	for i in empty:
		hearts[len(hearts) - i - 1].texture = HEART_EMPTY

func _on_update_ammo(ammo: float, max_ammo: float) -> void:
	
	var ammo_len = len(ammo_container.get_children())
	
	if ammo_len < max_ammo:
		for i in (max_ammo - ammo_len):
			var textRect = TextureRect.new()
			textRect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
			textRect.stretch_mode = TextureRect.STRETCH_KEEP
			ammo_container.add_child(textRect)
		
	var bullets = ammo_container.get_children()	
	
	print(ammo, " ", max_ammo)
	
	for i in ammo:
		bullets[i].texture = BULLET
	
	for i in (max_ammo - ammo):
		bullets[len(bullets) - i - 1].texture = EMPTY
		
