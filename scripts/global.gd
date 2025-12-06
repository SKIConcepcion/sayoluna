extends Node

var removed_text_nodes = {}

var player_position: Vector2 = Vector2(0, 0)
var player_facing_left: bool = false

var speech_identifier: int = 0
var toggle_on: bool = false
var signal_on: bool = false
var robot_gone: bool = false
var factory_on: bool = false


signal todo_changed(new_todo: String)

var to_do: String = "mend what has been broken" :
	set(value):
		to_do = value
		todo_changed.emit(value)
	get:
		return to_do

func set_to_do(value: String) -> void:
	to_do = value
	emit_signal("todo_changed", value)


### ITEMS
var has_bike_key: bool = false
var used_bike_key: bool = false

var has_moon_flower: bool = false
var used_moon_flwoer: bool = false

var has_solar_panel_umbrella: bool = false
var used_solar_panel_umbrella: bool = false

var has_resume: bool = false
var used_resume: bool = false

var has_bottle_of_luster: bool = false
var used_bottle_of_luster: bool = false
