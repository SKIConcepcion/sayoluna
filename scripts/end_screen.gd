extends Control

@onready var sublabel: Label = $Sublabel

func _ready() -> void:
	sublabel.modulate.a = 0.0  # start fully transparent
	_show_sublabel_delayed()


func _show_sublabel_delayed() -> void:
	await get_tree().create_timer(2.0).timeout  # wait 2 seconds

	var tween = create_tween()
	tween.tween_property(sublabel, "modulate:a", 1.0, 1.5)  # fade in over 1.5 seconds
