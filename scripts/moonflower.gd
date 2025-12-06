extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if Global.has_moon_flower or Global.used_moon_flwoer:
		sprite_2d.visible = false
		set_deferred("monitoring", false)   # disable triggers if already picked up

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Sol" or body.name == "Luna") and !Global.used_moon_flwoer and !Global.has_moon_flower:
		_pickup_item()

func _pickup_item():
	GlobalSfx.play_item_pickup()
	Global.to_do = "return to the robot"
	Global.has_moon_flower = true
	sprite_2d.visible = false
	set_deferred("monitoring", false)   # disable further triggers safely
	
	# Save player state
	var player = get_tree().current_scene.get_node("Sol") # adjust path if needed
	Global.player_position = player.global_position
	Global.player_facing_left = player.sprite.flip_h
	
	# Switch scene
	Transition.change_scene("res://scenes/main_night.tscn", false)
