extends HBoxContainer

@onready var label: Label = $Label

var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func set_up_hud(player: CharacterBody2D) -> void:
	self.player = player
	player.update_wallet_hud.connect(_on_update_wallet_hud)
	_on_update_wallet_hud(player.wallet_amount)
	print("got signal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_update_wallet_hud(amount: int) -> void:
	label.text = "%d" % amount
	
