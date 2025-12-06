extends Control


func _on_back_pressed() -> void:
	GlobalSfx.play_btn_click()
	Transition.change_scene("res://scenes/title_screen.tscn", false)
