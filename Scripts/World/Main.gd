extends Node2D
	
func _on_meche_just_snapped():
	$Explosion.play()
	
	$Timer.start()
	await $Timer.timeout
	$explosion.emitting=true

func _on_audio_stream_player_finished():
	$explosion.emitting=false
	if get_tree().change_scene_to_file("res://Scenes/World/Ending.tscn") != OK:
		print ("Error passing from Opening scene to ending scene")
