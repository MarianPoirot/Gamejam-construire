extends Control

func _physics_process(_delta):
	if Input.is_action_pressed("start"):
		_on_button_button_down()

func _on_button_button_down():
	if get_tree().change_scene_to_file("res://Scenes/World/Main.tscn") != OK:
		print ("Error passing from Opening scene to main scene")
