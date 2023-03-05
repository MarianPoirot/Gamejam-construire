extends Node2D
	
func _on_meche_just_snapped():
	$Explosion.play()
	
	$Timer.start()
	await $Timer.timeout
	$explosion.emitting=true
	disperser_objets()

func _on_audio_stream_player_finished():
	$explosion.emitting=false
	if get_tree().change_scene_to_file("res://Scenes/World/Ending.tscn") != OK:
		print ("Error passing from Opening scene to ending scene")

func disperser_objets():
	var tween = get_tree().create_tween()
	for c in get_children().filter(func(c):return c is Piece):
		tween.parallel().tween_property(c, "position", c.position + (c.position-$Centre.position)*20.0, 2.0).set_ease(Tween.EASE_OUT)
