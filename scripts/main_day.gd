extends Node2D

@onready var pickup_tutorial: Label = $Texts/PickupTutorial

@onready var up_border: Area2D = $Triggers/UpBorder
@onready var down_border: Area2D = $Triggers/DownBorder
@onready var left_border: Area2D = $Triggers/LeftBorder
@onready var right_border: Area2D = $Triggers/RightBorder

@onready var radio_signal: Sprite2D = $Misc/RadioSignal
@onready var robot: AnimatedSprite2D = $Npcs/Robot
@onready var resume: Area2D = $Items/Resume
@onready var smoke: Sprite2D = $Misc/Smoke
@onready var smoke_2: Sprite2D = $Misc/Smoke2


func _ready() -> void:
	if Global.has_bike_key:
		pickup_tutorial.visible = false
	
	if Global.robot_gone:
		robot.queue_free()
		
		
	if Global.to_do == "claim the resume in the morning":
		resume.visible = true
		resume.monitoring = true 
	else:
		resume.visible = false
		resume.monitoring = false


	if Global.signal_on:
		_start_radio_signal_pulse()
		
	if Global.factory_on:
		_start_smoke_effect()

	# (make sure these aren’t also connected in the editor!)
	up_border.body_entered.connect(_on_up_border_body_entered)
	down_border.body_entered.connect(_on_down_border_body_entered)
	left_border.body_entered.connect(_on_left_border_body_entered)
	right_border.body_entered.connect(_on_right_border_body_entered)



func _start_smoke_effect() -> void:
	# Smoke 1
	var tween1 := create_tween().set_loops()
	smoke.scale = Vector2(0.2, 0.2)   # start small
	smoke.modulate.a = 1.0            # start opaque
	
	tween1.tween_property(smoke, "scale", Vector2(1.5, 1.5), 2.5)
	tween1.parallel().tween_property(smoke, "modulate:a", 0.0, 2.5)
	tween1.tween_callback(func ():
		smoke.scale = Vector2(0.2, 0.2)
		smoke.modulate.a = 1.0
	)

	# Smoke 2 (delayed for staggered puffing)
	var tween2 := create_tween().set_loops()
	smoke_2.scale = Vector2(0.2, 0.2)
	smoke_2.modulate.a = 1.0

	tween2.tween_interval(1.2)  # delay start for offset puff
	tween2.tween_property(smoke_2, "scale", Vector2(1.5, 1.5), 2.5)
	tween2.parallel().tween_property(smoke_2, "modulate:a", 0.0, 2.5)
	tween2.tween_callback(func ():
		smoke_2.scale = Vector2(0.2, 0.2)
		smoke_2.modulate.a = 1.0
	)



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
	if body.name == "Luna":
		var new_pos = body.global_position
		# Place a bit below the down border
		new_pos.y = down_border.global_position.y - 100
		body.global_position = new_pos


func _on_down_border_body_entered(body: Node) -> void:
	if body.name == "Luna":
		var new_pos = body.global_position
		# Place a bit above the up border
		new_pos.y = up_border.global_position.y + 100
		body.global_position = new_pos


func _on_left_border_body_entered(body: Node) -> void:
	if body.name == "Luna":
		var new_pos = body.global_position
		# Place a bit left of the right border
		new_pos.x = right_border.global_position.x - 100
		body.global_position = new_pos


func _on_right_border_body_entered(body: Node) -> void:
	if body.name == "Luna":
		var new_pos = body.global_position
		# Place a bit right of the left border
		new_pos.x = left_border.global_position.x + 100
		body.global_position = new_pos
