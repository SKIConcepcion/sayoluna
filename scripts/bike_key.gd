extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if Global.has_bike_key or Global.used_bike_key:
		sprite_2d.visible = false
		set_deferred("monitoring", false)   # disable triggers if already picked up

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Sol" or body.name == "Luna") and !Global.used_bike_key and !Global.has_bike_key:
		_pickup_item()

func _pickup_item():
	GlobalSfx.play_item_pickup()
	Global.to_do = "return to the bike"
	Global.has_bike_key = true
	sprite_2d.visible = false
	set_deferred("monitoring", false)   # disable further triggers safely
	
	# Save player state
	var player = get_tree().current_scene.get_node("Luna") # adjust path if needed
	Global.player_position = player.global_position
	Global.player_facing_left = player.sprite.flip_h
	
	# Switch scene
	Transition.change_scene("res://scenes/main_day.tscn", true)
