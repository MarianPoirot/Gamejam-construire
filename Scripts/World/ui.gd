extends Control

var sens = 0

func _process(delta):
	if sens<0:
		EventBus.emit_signal("tapis_roulant_monter")
	elif sens>0:
		EventBus.emit_signal("tapis_roulant_descendre")



func _on_up_button_down():
	sens = 1

func _on_down_button_down():
	sens = -1


func _on_move_button_up():
	sens = 0


func _on_manuel_toggled(button_pressed):
	var target = Vector2(0, -510)
	if button_pressed:
		target = Vector2.ZERO
		$Manuel.call_deferred("grab_focus")
		$Manuel.call_deferred("grab_click_focus")
	get_tree().create_tween().tween_property($Manuel, "position", target, 0.5).set_ease(Tween.EASE_IN_OUT)
