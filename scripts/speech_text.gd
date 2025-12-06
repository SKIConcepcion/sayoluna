extends Node2D

var triggered_convo = false
@onready var label: Label = $Label

func _ready():
	if Global.removed_text_nodes.has(self.name) and Global.removed_text_nodes[self.name]:
		queue_free()
		return

	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	label.visible = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Sol" or body.name == "Luna":
		var dialogue = ""
		
		label.add_theme_constant_override("outline_size", 18)

		if body.name == "Luna":
			label.add_theme_color_override("font_color", Color8(40, 40, 40))
			label.add_theme_color_override("font_outline_color", Color8(255, 255, 255))
		else: # Sol
			label.add_theme_color_override("font_color", Color8(255, 255, 255))
			label.add_theme_color_override("font_outline_color", Color8(40, 40, 40))


		match self.name:


			"sol_text_01":
				dialogue = "Where could\nI possibly left\nmy bike's lock key"
				Global.toggle_on = true
				Global.to_do = "find bike key"


			"sol_text_02":
				dialogue = "There's no point\nof going back"
				Global.toggle_on = true


			"sol_text_03":
				dialogue = "The moon lost its luster...\nand my heart aches to mend it"
				
				if Global.to_do == "mend what has been broken":
					Global.to_do = "find a way to fix what has been broken"

			"sol_text_04":
				dialogue = "A solar panel umbrella?\nThis looks promising... but he's sleeping"




			"luna_text_01":
				dialogue = "The memory of our\nfirst meeting lingers..."


			"luna_text_02":
				dialogue = "The sun lost its warmth...\nand my heart aches to mend it"

				if Global.to_do == "mend what has been broken":
					Global.to_do = "find a way to fix what has been broken"





			_:
				dialogue = ""

		label.text = dialogue
		label.visible = true

		if !triggered_convo:
			$AnimationPlayer.play("show")
			triggered_convo = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Sol" or body.name == "Luna":
		$Area2D.set_deferred("monitoring", false)
		fade_out_label_after_exit()


func fade_out_label_after_exit() -> void:
	await get_tree().create_timer(2).timeout

	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 2.0)
	await tween.finished

	label.visible = false
	Global.removed_text_nodes[self.name] = true
	queue_free()
