extends CanvasLayer

func change_scene(target: String, is_day: bool, delay: float = 0.0) -> void:
	var anim_name = "fade_day" if is_day else "fade_night"

	# Play forward
	$AnimationPlayer.play(anim_name)
	await $AnimationPlayer.animation_finished

	# Optional delay
	if delay > 0:
		await get_tree().create_timer(delay).timeout

	# Switch scene
	get_tree().change_scene_to_file(target)

	# Play backwards
	$AnimationPlayer.play_backwards(anim_name)
