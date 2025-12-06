extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D
@onready var pointer: Sprite2D = $"../Pointer"
@onready var disk: Area2D = $Camera2D/Disk
@onready var disk_shape: CollisionShape2D = disk.get_node("CollisionShape2D")
@onready var disk_label: Label = $Camera2D/DiskLabel
@onready var hand_label: Label = $Camera2D/HandLabel
@onready var todo_label: Label = $Camera2D/TodoLabel


var speed: float = 160.0
var target_position: Vector2
var moving: bool = false
var pointer_tween: Tween

func _ready():
	# Restore position & facing direction if saved
	if Global.player_position != Vector2.ZERO:
		global_position = Global.player_position
	sprite.flip_h = Global.player_facing_left

	_update_hand_label()
	_update_todo_label()

	# Auto-update todo whenever Global changes
	Global.todo_changed.connect(_on_todo_changed)

	

func _update_hand_label():
	if Global.has_bike_key:
		hand_label.visible = true
		hand_label.text = "You are holding a Bike Key"

	elif Global.has_moon_flower:
		hand_label.visible = true
		hand_label.text = "You are holding a Moonflower"

	elif Global.has_solar_panel_umbrella:
		hand_label.visible = true
		hand_label.text = "You are holding an Umbrella"

	elif Global.has_resume:
		hand_label.visible = true
		hand_label.text = "You are holding a Resume"

	elif Global.has_bottle_of_luster:
		hand_label.visible = true
		hand_label.text = "You are holding a Bottle of Luster"

	else:
		hand_label.visible = false


func _on_todo_changed(new_todo: String) -> void:
	_update_todo_label()


func _update_todo_label():
	if Global.to_do != "":
		todo_label.visible = true
		todo_label.text = "To do: " + str(Global.to_do)
	else:
		todo_label.visible = false




# -------------------------
# Input
# -------------------------

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed:
		var mouse_pos = camera.get_global_mouse_position()

		# Check if tap is inside disk
		if disk_shape.shape.get_rect().has_point(disk.to_local(mouse_pos)):
			_rotate_and_switch()
			return

		# Otherwise move player
		GlobalSfx.play_btn_click()
		target_position = mouse_pos
		moving = true
		_show_pointer(target_position)


# -------------------------
# Physics
# -------------------------

func _physics_process(_delta):
	if moving:
		_move_to_target()
		move_and_slide()
		return

	_idle()
	move_and_slide()


# -------------------------
# Helpers
# -------------------------

func _move_to_target():
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed
	
	if sprite.animation != "moving":
		sprite.play("moving")

	if direction.x != 0:
		sprite.flip_h = direction.x < 0

	# Stop if close to target
	if global_position.distance_to(target_position) < 5:
		moving = false
		_idle()
		pointer.visible = false


func _idle():
	velocity = Vector2.ZERO
	if sprite.animation != "idle":
		sprite.play("idle")


func _show_pointer(pos: Vector2):
	pointer.global_position = pos
	pointer.visible = true

	# Kill old tween if running
	if pointer_tween and pointer_tween.is_running():
		pointer_tween.kill()

	# New bounce tween
	pointer_tween = create_tween().set_loops()
	pointer_tween.tween_property(pointer, "position:y", pointer.position.y - 10, 0.3) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	pointer_tween.tween_property(pointer, "position:y", pointer.position.y, 0.3) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)


func _rotate_and_switch():
	if Global.toggle_on:
		var tween = create_tween()
		tween.tween_property(disk, "rotation", disk.rotation - PI, 1) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

		var current_name = get_tree().current_scene.name
		var is_day = current_name == "main_night"
		GlobalSfx.switch_daytime(is_day)
		_save_player_state()
		_switch_scene()
	else:
		disk_label.visible = true
		disk_label.modulate.a = 1.0  # Ensure fully visible

		# Wait 3 seconds
		await get_tree().create_timer(3.0).timeout

		# Create a Tween
		var tween = create_tween()
		tween.tween_property(disk_label, "modulate:a", 0.0, 2.0)

		# Wait for tween to finish
		await tween.finished

		# Optionally hide the label after fade
		disk_label.visible = false



func _save_player_state():
	Global.player_position = global_position
	Global.player_facing_left = sprite.flip_h


func _switch_scene():
	var current_name = get_tree().current_scene.name
	var is_day = current_name == "main_night"
	var next_scene = "res://scenes/main_day.tscn" if is_day else "res://scenes/main_night.tscn"

	Transition.change_scene(next_scene, is_day)
