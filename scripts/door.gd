extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Sol" or body.name == "Luna"):
		if self.name == "BikeRide" and Global.has_bike_key:
			Global.has_bike_key = false
			Global.used_bike_key = true
			Transition.change_scene("res://scenes/bike_scene.tscn", false, 1.0)


		if self.name == "OwlConvo01" and Global.to_do == "find a way to fix what has been broken":
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Transition.change_scene("res://scenes/speech_screen.tscn", false, 1.0)

		if self.name == "OwlConvo02" and Global.to_do == "give the resume to the owl":
			GlobalSfx.stop_daytime_music()
			Global.toggle_on = false
			Global.has_resume = false
			Global.used_resume = true
			Transition.change_scene("res://scenes/speech_screen.tscn", false, 1.0)


		if self.name == "CeoConvo01" and Global.to_do == "go to the resume factory":
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Transition.change_scene("res://scenes/speech_screen.tscn", false, 1.0)


		if self.name == "CeoConvo02" and Global.to_do == "bring the solar panel umbrella to the CEO":
			Global.has_solar_panel_umbrella = false
			Global.used_solar_panel_umbrella = true
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Transition.change_scene("res://scenes/speech_screen.tscn", false, 1.0)


		if self.name == "RobotConvo01" and Global.to_do == "get electricity from the city":
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Transition.change_scene("res://scenes/speech_screen.tscn", true, 1.0)


		if self.name == "RobotConvo02" and Global.has_moon_flower:
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Global.has_moon_flower = false
			Global.used_moon_flwoer = true
			Transition.change_scene("res://scenes/speech_screen.tscn", true, 1.0)


		if self.name == "SignalOn" and Global.to_do == "turn on the radio tower":
			Global.signal_on = true
			Global.to_do = "return to the robot"
			var player = get_tree().current_scene.get_node("Luna")
			Global.player_position = player.global_position
			Global.player_facing_left = player.sprite.flip_h
			Transition.change_scene("res://scenes/main_day.tscn", true)


		if self.name == "RobotConvo03" and Global.signal_on:
			GlobalSfx.stop_daytime_music()
			GlobalSfx.play_speech()
			Global.signal_on = false
			Transition.change_scene("res://scenes/speech_screen.tscn", true, 1.0)


		if self.name == "FixMoon" and Global.to_do == "fix the moon":
			GlobalSfx.stop_daytime_music()
			Global.has_bottle_of_luster = false
			Global.used_bottle_of_luster = true
			Transition.change_scene("res://scenes/end_scene.tscn", false, 2.0)



func _on_body_exited(body: Node2D) -> void:
	pass
