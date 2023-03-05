extends Control

func _ready():
	$Win.play()
	
func _physics_process(_delta):
	if Input.is_action_pressed("restart"):
		_on_button_button_down()

func _on_button_button_down():
	if get_tree().change_scene_to_file("res://Scenes/World/Main.tscn") != OK:
		print ("Error passing from Opening scene to main scene")

func _on_win_finished():
	$Yeay.play()
	var tween = $CanvasLayer/Gamins.create_tween()
	tween.tween_property($CanvasLayer/Gamins, "position", Vector2(516, 475), 1)


func _on_yeay_finished():
	var tween = $CanvasLayer/Gamins.create_tween()
	tween.tween_property($CanvasLayer/Gamins, "position", Vector2(516, 722), 1)
