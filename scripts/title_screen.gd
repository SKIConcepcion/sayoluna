extends Control


func _on_start_pressed() -> void:
	GlobalSfx.play_btn_click()
	Transition.change_scene("res://scenes/main_night.tscn", false)
	GlobalSfx.stop_bg(-50, 5.0)
	GlobalSfx.play_evening()


func _on_credits_pressed() -> void:
	GlobalSfx.play_btn_click()
	Transition.change_scene("res://scenes/credits_screen.tscn", true)


func _on_exit_pressed() -> void:
	pass # Replace with function body.
