extends Node2D

@onready var movement_tutorial: Label = $Texts/MovementTutorial
@onready var switch_tutorial: Label = $Texts/SwitchTutorial

@onready var up_border: Area2D = $Triggers/UpBorder
@onready var down_border: Area2D = $Triggers/DownBorder
@onready var left_border: Area2D = $Triggers/LeftBorder
@onready var right_border: Area2D = $Triggers/RightBorder

@onready var radio_signal: Sprite2D = $Misc/RadioSignal
@onready var moonflower: Area2D = $Items/Moonflower


func _ready() -> void:
	if Global.toggle_on:
		movement_tutorial.visible = false
		switch_tutorial.visible = false

	# Spawn moonflower only if required
	if Global.to_do == "find the moonflower from the garden":
		moonflower.visible = true
		moonflower.monitoring = true   # enable collision
	else:
		moonflower.visible = false
		moonflower.monitoring = false



	if Global.signal_on:
		_start_radio_signal_pulse()

	# (make sure these aren’t also connected in the editor!)
	up_border.body_entered.connect(_on_up_border_body_entered)
	down_border.body_entered.connect(_on_down_border_body_entered)
	left_border.body_entered.connect(_on_left_border_body_entered)
	right_border.body_entered.connect(_on_right_border_body_entered)



func _start_radio_signal_pulse() -> void:
	var tween := create_tween().set_loops() # loop forever
	radio_signal.scale = Vector2(0.1, 0.1)   # start small
	radio_signal.modulate.a = 1.0            # start visible

	# Grow and fade out simultaneously
	tween.tween_property(radio_signal, "scale", Vector2(1.5, 1.5), 3.0)
	tween.parallel().tween_property(radio_signal, "modulate:a", 0.0, 3.0)

	# Reset instantly to small + visible to repeat
	tween.tween_callback(func ():
		radio_signal.scale = Vector2(0.1, 0.1)
		radio_signal.modulate.a = 1.0
	)


func _on_up_border_body_entered(body: Node) -> void:
	if body.name == "Sol":
		var new_pos = body.global_position
		new_pos.y = down_border.global_position.y - 100
		body.global_position = new_pos


func _on_down_border_body_entered(body: Node) -> void:
	if body.name == "Sol":
		var new_pos = body.global_position
		new_pos.y = up_border.global_position.y + 100
		body.global_position = new_pos


func _on_left_border_body_entered(body: Node) -> void:
	if body.name == "Sol":
		var new_pos = body.global_position
		new_pos.x = right_border.global_position.x - 100
		body.global_position = new_pos


func _on_right_border_body_entered(body: Node) -> void:
	if body.name == "Sol":
		var new_pos = body.global_position
		new_pos.x = left_border.global_position.x + 100
		body.global_position = new_pos
