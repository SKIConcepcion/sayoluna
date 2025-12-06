extends Control

@onready var label: Label = $Label

# Each message is [text, interval_in_seconds]
var messages = [
	["The moon is whole again...", 5.0],
	["The moon finally got its luster", 5.0],
	["And as for the sun...", 4.0],
	["It needs warmth to be fixed.", 5.0],
	["So I went back to the owl and asked for a bottle of warmth.", 7.0],
	["But when I approached him, the owl said...", 5.0],
	["“ Silly you! There is no bottle of warmth. ”", 5.0],
	["“ But how can I fix the sun? ”, I pleaded in desperation.", 7.0],
	["“ Please... tell me, how can Luna and I fix the sun? ”", 5.0],
	["The owl looked at me and replied...", 5.0],
	["“ Perhaps some things are not meant to be fixed. ”", 5.0],
	["“ Perhaps some things are not meant to be perfect. ”", 5.0],
	["“ And perhaps... the sun and moon can never be together. ”", 8.0],
	["And in that moment, I remembered...", 5.0],
	["It was meant to be perfect.", 4.0],
	["At least, I thought it was perfect.", 4.0],
	["But in a single night, it fell apart.", 4.0],
	["And when it came time to mend what was broken...", 5.0],
	["I tried.", 5.0],
	
	["Or at least, I thought I tried.", 4.0],
	["But back then, I didn't.", 4.0],
	["And back when it came time to mend what was broken...", 7.0],
	["I chose to quit.", 5.0],
	
	["And in quitting, I told myself it was mercy...", 5.0],
	["That maybe the sun and moon\nwere never meant to share the same sky...", 7.0],
	
	["That maybe this was the best for us...", 3.0],
	["That maybe this was the best for me...", 3.0],
	["That maybe this was the best for you, Luna...", 3.5],
	
	["And so this is the end of my letter...", 3.5],
	["From Sean,", 2.5],
	["To you, L", 5.0],
]

var message_index: int = 0
var timer: Timer


func _ready() -> void:
	GlobalSfx.play_bg()
	label.text = messages[message_index][0]

	# Create timer
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

	# Start first cycle
	_start_timer_for_current_message()

	# Transition to another scene after 170 seconds
	await get_tree().create_timer(180.0).timeout
	Transition.change_scene("res://scenes/end_screen.tscn", false)
	GlobalSfx.stop_bg(-50, 5.0)


func _on_timer_timeout() -> void:
	# Fade out
	var tween := create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 1.0) # fade out in 1s
	tween.tween_callback(Callable(self, "_change_message"))
	tween.tween_property(label, "modulate:a", 1.0, 1.0) # fade in in 1s


func _change_message() -> void:
	message_index = (message_index + 1) % messages.size()
	label.text = messages[message_index][0]
	_start_timer_for_current_message()


func _start_timer_for_current_message() -> void:
	timer.wait_time = messages[message_index][1]
	timer.start()
