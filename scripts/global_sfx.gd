extends Node

@onready var bg_music: AudioStreamPlayer = $BgMusic
@onready var button_click: AudioStreamPlayer = $ButtonClick
@onready var morning_music: AudioStreamPlayer = $MorningMusic
@onready var evening_music: AudioStreamPlayer = $EveningMusic
@onready var pickup_music: AudioStreamPlayer = $PickupMusic
@onready var speech_music: AudioStreamPlayer = $SpeechMusic


func play_btn_click() -> void:
	button_click.play()

func play_item_pickup() -> void:
	pickup_music.play()


func play_speech() -> void:
	speech_music.volume_db = -40  # start muted
	speech_music.play()

	var tween := create_tween()
	tween.tween_property(speech_music, "volume_db", 0, 3.0)  # fade in over 2 seconds


func stop_speech(db: int = -50, duration: float = 1.0) -> void:
	var tween := create_tween()
	tween.tween_property(speech_music, "volume_db", db, duration)
	tween.tween_callback(speech_music.stop)
	tween.tween_callback(func(): speech_music.volume_db = 0)



func play_bg() -> void:
	bg_music.play()

func lower_bg(duration: float = 1.0, target_db: float = -10.0) -> void:
	var tween := create_tween()
	tween.tween_property(bg_music, "volume_db", target_db, duration)


func stop_bg(db: int = -50, duration: float = 1.0) -> void:
	var tween := create_tween()
	tween.tween_property(bg_music, "volume_db", db, duration)
	tween.tween_callback(bg_music.stop)
	tween.tween_callback(func(): bg_music.volume_db = 0)







func play_evening() -> void:
	evening_music.play()

func play_morning() -> void:
	morning_music.play()



func switch_daytime(is_morning: bool, duration: float = 2.0) -> void:
	if is_morning:
		# Fade out evening music if playing
		if evening_music.playing:
			var tween_out := create_tween()
			tween_out.tween_property(evening_music, "volume_db", -80, duration)
			tween_out.tween_callback(evening_music.stop)
		# Start morning music and fade in
		morning_music.volume_db = -80
		morning_music.play()
		var tween_in := create_tween()
		tween_in.tween_property(morning_music, "volume_db", 0, duration)
	else:
		# Fade out morning music if playing
		if morning_music.playing:
			var tween_out := create_tween()
			tween_out.tween_property(morning_music, "volume_db", -80, duration)
			tween_out.tween_callback(morning_music.stop)
		# Start evening music and fade in
		evening_music.volume_db = -80
		evening_music.play()
		var tween_in := create_tween()
		tween_in.tween_property(evening_music, "volume_db", 0, duration)


func stop_daytime_music() -> void:
	if morning_music.playing:
		var tween_out := create_tween()
		tween_out.tween_callback(morning_music.stop)
		tween_out.tween_callback(func(): morning_music.volume_db = 0)
	elif evening_music.playing:
		var tween_out := create_tween()
		tween_out.tween_callback(evening_music.stop)
		tween_out.tween_callback(func(): evening_music.volume_db = 0)
