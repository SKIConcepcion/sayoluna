extends Control

@onready var bike: Sprite2D = $Bike/Bike
@onready var wheel: Sprite2D = $Bike/Bike/Wheel
@onready var wheel_2: Sprite2D = $Bike/Bike/Wheel2
@onready var background: Node2D = $Background
@onready var label: Label = $Label
@onready var radio_signal: Sprite2D = $Background/RadioTower/RadioSignal


var speed: float = 150.0   # background scrolling speed
var rotation_speed: float = 5.0 # how fast the wheels spin

# Messages for the label to cycle through
var messages = [
	"And so I set out on a journey...",
	"To mend what has been broken,",
	"To bring the sun and moon together once more.",
	"Even if the heavens say it’s impossible,",
	"I will still try...",
	"Because I know you would do the same,",
	"I only wish it wasn’t this hard,",
	"I only wish it were as perfect\nas it was meant to be.",
	"Regardless, I would do this for us...\nfor you, Luna."
];



var message_index: int = 0

# Bike movement
var bike_moving := false
var bike_move_amplitude := 70.0 # how far up/down
var bike_move_speed := 1.5      # oscillation speed
var bike_start_y := 0.0
var bike_time := 0.0

func _ready() -> void:
	GlobalSfx.stop_daytime_music()
	GlobalSfx.play_bg()
	label.text = messages[message_index]

	bike_start_y = bike.position.y  # remember starting y

	# Timer for cycling messages
	var timer := Timer.new()
	timer.wait_time = 5.0
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

	# Start bike up/down motion after 10 seconds
	_start_bike_motion_delayed()

	# Start pulsating the radio signal
	_start_radio_signal_pulse()

	# Transition to another scene after 45 seconds
	await get_tree().create_timer(45.0).timeout
	GlobalSfx.stop_bg(-30, 10.0)
	Global.player_position = Vector2(0, 5000)
	Global.to_do = "mend what has been broken"
	Transition.change_scene("res://scenes/main_night.tscn", false, 3.0)
	GlobalSfx.play_evening()


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




func _process(delta: float) -> void:
	# Scroll background to the left
	background.position.x -= speed * delta

	# Spin the wheels
	wheel.rotation += rotation_speed * delta
	wheel_2.rotation += rotation_speed * delta
	

func _on_timer_timeout() -> void:
	# Fade out
	var tween := create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 1.0) # fade out in 1s
	tween.tween_callback(Callable(self, "_change_message"))
	tween.tween_property(label, "modulate:a", 1.0, 1.0) # fade back in in 1s

func _change_message() -> void:
	message_index = (message_index + 1) % messages.size()
	label.text = messages[message_index]

func _start_bike_motion_delayed() -> void:
	
	# Smoothly move bike back to original y
	var tween = create_tween()
	tween.tween_property(bike, "position:y", bike_start_y, 1.0) # 1 second to return
