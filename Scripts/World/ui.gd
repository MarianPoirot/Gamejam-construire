extends Control

var sens = 0

func _process(delta):
	if sens<0:
		EventBus.emit_signal("tapis_roulant_monter")
	elif sens>0:
		EventBus.emit_signal("tapis_roulant_descendre")



func _on_up_button_down():
	sens = -1

func _on_down_button_down():
	sens = 1


func _on_move_button_up():
	sens = 0
