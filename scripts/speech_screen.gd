extends Control

@onready var label: Label = $Label
@onready var color_rect: ColorRect = $ColorRect
@onready var next: Button = $Next

@onready var sol: AnimatedSprite2D = $Sol
@onready var luna: AnimatedSprite2D = $Luna
@onready var robot: AnimatedSprite2D = $Robot
@onready var mr_owl: AnimatedSprite2D = $MrOwl
@onready var ceo: AnimatedSprite2D = $Ceo


func _ready() -> void:
	update_label()

func luna_preset() -> void:
	color_rect.color = Color(255,255,255)
	label.add_theme_color_override("font_color", Color8(40, 40, 40))
	next.add_theme_color_override("font_color", Color8(40, 40, 40))

func _on_next_pressed() -> void:
	GlobalSfx.play_btn_click()
	change_scene_by_stage(Global.speech_identifier)


func update_label() -> void:
	match Global.speech_identifier:
		0:
			label.text = "It was meant to be perfect."
		1:
			label.text = "At least, I thought it was perfect."
		2:
			label.text = "But in a single night, it fell apart."
		3:
			label.text = "And when it came time to mend what was broken..."
		4:
			label.text = "I tried."


		5:
			label.text = "You look lost, do you need anything?"
			mr_owl.visible = true
		6:
			label.text = "I am trying to fix the moon"
			sol.visible = true
		7:
			label.text = "Fix the moon? ha... how do you plan on fixing the moon?"
			mr_owl.visible = true
		8:
			label.text = "I must return its luster"
			sol.visible = true
		9:
			label.text = "How convenient... I just so happen to have a bottle of luster on hand"
			mr_owl.visible = true
		10:
			label.text = "Can I have it by any chance?"
			sol.visible = true
		11:
			label.text = "You see, I do have a bottle of luster... but I don't have a job"
			mr_owl.visible = true
		12:
			label.text = "Then what can I do?"
			sol.visible = true
		13:
			label.text = "I need a resume... but I can't create one for I have no hands"
			mr_owl.visible = true
		14:
			label.text = "A resume...?"
			sol.visible = true
		15:
			label.text = "Yes, lucky you... there's a resume factory that lies to the south-east"
			mr_owl.visible = true
		16:
			label.text = "A factory for resumes?"
			sol.visible = true
		17:
			label.text = "Indeed... bring me a resume, and the bottle of luster shall be yours"
			mr_owl.visible = true


		18:
			label.text = "You look lost, need something?"
			ceo.visible = true
		19:
			label.text = "I need a resume"
			sol.visible = true
		20:
			label.text = "Well you came at the right place, but at the wrong time"
			ceo.visible = true
		21:
			label.text = "What... what do you mean?"
			sol.visible = true
		22:
			label.text = "Electricity is busted, without electricity we can't create a resume"
			ceo.visible = true
		23:
			label.text = "Is there anything I can do to help?"
			sol.visible = true
		24:
			label.text = "I need a source of electricity... generator, solar panel, or something"
			ceo.visible = true
		25:
			label.text = "But where?"
			sol.visible = true
		26:
			label.text = "I mean the city just west of here got power, so maybe start there"
			ceo.visible = true


		27:
			label.text = "You look lost, can I help you?"
			robot.visible = true
			luna_preset()
		28:
			label.text = "Yes, I need your solar panel umbrella"
			luna.visible = true
			luna_preset()
		29:
			label.text = "I can give it to you, but I need your help"
			robot.visible = true
			luna_preset()
		30:
			label.text = "Then what can I do?"
			luna.visible = true
			luna_preset()
		31:
			label.text = "I need a moonflower…"
			robot.visible = true
			luna_preset()
		32:
			label.text = "A moonflower?"
			luna.visible = true
			luna_preset()
		33:
			label.text = "Yes. It's the only gift worthy of her… when we finally meet"
			robot.visible = true
			luna_preset()
		34:
			label.text = "So you want me to find it?"
			luna.visible = true
			luna_preset()
		35:
			label.text = "Please... only then will I give you the umbrella"
			robot.visible = true
			luna_preset()
		36:
			label.text = "Alright, where can I find this moonflower?"
			luna.visible = true
			luna_preset()
		37:
			label.text = "They say it blooms only at night in the garden north-east from here"
			robot.visible = true
			luna_preset()
		38:
			label.text = "Huh? that shouldn't be hard I suppose..."
			luna.visible = true
			luna_preset()
		39:
			label.text = "Thank you... my heart depends on it."
			robot.visible = true
			luna_preset()


		40:
			label.text = "Here's the moonflower you're talking about"
			luna.visible = true
			luna_preset()
		41:
			label.text = "Thank you, but..."
			robot.visible = true
			luna_preset()
		42:
			label.text = "But what?"
			luna.visible = true
			luna_preset()
		43:
			label.text = "I just realized that without my umbrella, I won't have a power"
			robot.visible = true
			luna_preset()
		44:
			label.text = "Oh..."
			luna.visible = true
			luna_preset()
		45:
			label.text = "Without a source of power, my battery won't last long to get to her"
			robot.visible = true
			luna_preset()
		46:
			label.text = "..."
			luna.visible = true
			luna_preset()
		47:
			label.text = "Wait... maybe I don’t need this body at all"
			robot.visible = true
			luna_preset()
		48:
			label.text = "What do you mean?"
			luna.visible = true
			luna_preset()
		49:
			label.text = "If I can send my mind across the internet waves..."
			robot.visible = true
			luna_preset()
		50:
			label.text = "Then you wouldn’t need to travel to her"
			luna.visible = true
			luna_preset()
		51:
			label.text = "Exactly! I can finally communicate with her via the internet"
			robot.visible = true
			luna_preset()
		52:
			label.text = "So what do you need me to do?"
			luna.visible = true
			luna_preset()
		53:
			label.text = "There’s an internet tower just north of here"
			robot.visible = true
			luna_preset()
		54:
			label.text = "Just turn it on, then I can upload my mind on the internet!"
			robot.visible = true
			luna_preset()
		55:
			label.text = "Upload your mind to the network?"
			luna.visible = true
			luna_preset()
		56:
			label.text = "Yes, please help me reach her through my mind in the signal"
			robot.visible = true
			luna_preset()


		57:
			label.text = "I can already sense the signal..."
			robot.visible = true
			luna_preset()
		58:
			label.text = "Thank you, Luna... with this, I can finally be able to meet her"
			robot.visible = true
			luna_preset()
		59:
			label.text = "You may now have my umbrella... I have no use for it anymore"
			robot.visible = true
			luna_preset()
		60:
			label.text = "I wish you the best... wherever the signal takes you."
			luna.visible = true
			luna_preset()


		61:
			label.text = "Perhaps this umbrella can help to solve the electricity problem?"
			sol.visible = true
		62:
			label.text = "Splendid! come back in the morning and the resume shall be ready"
			ceo.visible = true


		63:
			label.text = "Here... I brought you a resume"
			sol.visible = true
		64:
			label.text = "Ah, splendid! finally, I can apply for a job!"
			mr_owl.visible = true
		65:
			label.text = "So... does this mean I can have the bottle of luster?"
			sol.visible = true
		66:
			label.text = "Of course, a deal is a deal"
			mr_owl.visible = true
		67:
			label.text = "Here, take it... with this, you may return the moon’s luster"
			mr_owl.visible = true
		68:
			label.text = "Thank you!"
			sol.visible = true





func change_scene_by_stage(speech_identifier: int) -> void:
	match Global.speech_identifier:

		0:
			Global.speech_identifier = 1
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		1:
			Global.speech_identifier = 2
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		2:
			Global.speech_identifier = 3
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		3:
			Global.speech_identifier = 4
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		4:
			Global.speech_identifier = 5
			Transition.change_scene("res://scenes/title_screen.tscn", false, 2)
			GlobalSfx.play_bg()


		5:
			Global.speech_identifier = 6
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		6:
			Global.speech_identifier = 7
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		7:
			Global.speech_identifier = 8
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		8:
			Global.speech_identifier = 9
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		9:
			Global.speech_identifier = 10
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		10:
			Global.speech_identifier = 11
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		11:
			Global.speech_identifier = 12
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		12:
			Global.speech_identifier = 13
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		13:
			Global.speech_identifier = 14
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		14:
			Global.speech_identifier = 15
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		15:
			Global.speech_identifier = 16
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		16:
			Global.speech_identifier = 17
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		17:
			Global.speech_identifier = 18
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_evening()
			Global.to_do = "go to the resume factory"
			Global.player_position = Vector2(681, 4855)
			Transition.change_scene("res://scenes/main_night.tscn", false)


		18:
			Global.speech_identifier = 19
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		19:
			Global.speech_identifier = 20
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		20:
			Global.speech_identifier = 21
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		21:
			Global.speech_identifier = 22
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		22:
			Global.speech_identifier = 23
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		23:
			Global.speech_identifier = 24
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		24:
			Global.speech_identifier = 25
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		25:
			Global.speech_identifier = 26
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		26:
			Global.speech_identifier = 27
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_evening()
			Global.to_do = "get electricity from the city"
			Global.player_position = Vector2(2374, 6395)
			Transition.change_scene("res://scenes/main_night.tscn", false)


		27:
			Global.speech_identifier = 28
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		28:
			Global.speech_identifier = 29
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		29:
			Global.speech_identifier = 30
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		30:
			Global.speech_identifier = 31
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		31:
			Global.speech_identifier = 32
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		32:
			Global.speech_identifier = 33
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		33:
			Global.speech_identifier = 34
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		34:
			Global.speech_identifier = 35
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		35:
			Global.speech_identifier = 36
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		36:
			Global.speech_identifier = 37
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		37:
			Global.speech_identifier = 38
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		38:
			Global.speech_identifier = 39
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		39:
			Global.speech_identifier = 40
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_morning()
			Global.to_do = "find the moonflower from the garden"
			Global.player_position = Vector2(-2347, 6177)
			Transition.change_scene("res://scenes/main_day.tscn", true)


		40:
			Global.speech_identifier = 41
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		41:
			Global.speech_identifier = 42
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		42:
			Global.speech_identifier = 43
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		43:
			Global.speech_identifier = 44
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		44:
			Global.speech_identifier = 45
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		45:
			Global.speech_identifier = 46
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		46:
			Global.speech_identifier = 47
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		47:
			Global.speech_identifier = 48
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		48:
			Global.speech_identifier = 49
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		49:
			Global.speech_identifier = 50
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		50:
			Global.speech_identifier = 51
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		51:
			Global.speech_identifier = 52
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		52:
			Global.speech_identifier = 53
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		53:
			Global.speech_identifier = 54
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		54:
			Global.speech_identifier = 55
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		55:
			Global.speech_identifier = 56
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		56:
			Global.speech_identifier = 57
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_morning()
			Global.to_do = "turn on the radio tower"
			Global.player_position = Vector2(-2347, 6177)
			Transition.change_scene("res://scenes/main_day.tscn", true)


		57:
			Global.speech_identifier = 58
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		58:
			Global.speech_identifier = 59
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		59:
			Global.speech_identifier = 60
			Transition.change_scene("res://scenes/speech_screen.tscn", true)
		60:
			Global.speech_identifier = 61
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_morning()
			Global.to_do = "bring the solar panel umbrella to the CEO"
			Global.player_position = Vector2(-2347, 6177)
			Global.robot_gone = true
			Global.has_solar_panel_umbrella = true
			Transition.change_scene("res://scenes/main_day.tscn", true)


		61:
			Global.speech_identifier = 62
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		62:
			Global.speech_identifier = 63
			GlobalSfx.stop_speech(-30, 7.0)
			GlobalSfx.play_morning()
			Global.to_do = "claim the resume in the morning"
			Global.player_position = Vector2(2374, 6395)
			Transition.change_scene("res://scenes/main_night.tscn", false)


		63:
			Global.speech_identifier = 64
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		64:
			Global.speech_identifier = 65
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		65:
			Global.speech_identifier = 66
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		66:
			Global.speech_identifier = 67
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		67:
			Global.speech_identifier = 68
			Transition.change_scene("res://scenes/speech_screen.tscn", false)
		68:
			Global.speech_identifier = 69
			Global.to_do = "fix the moon"
			Global.has_bottle_of_luster = true
			Global.player_position = Vector2(681, 4855)
			Transition.change_scene("res://scenes/main_night.tscn", false)
			
