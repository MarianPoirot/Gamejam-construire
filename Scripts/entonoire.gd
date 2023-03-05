extends Dragable


var conteneur_liquide:Hook=null

func grab():
	super.grab()
	conteneur_liquide = null
	$Sprite2D.frame = 0

func release():
	super.release()
	try_snap()

func try_snap():
	if not $Sortie.get_overlapping_areas().is_empty():
		snap($Sortie.get_overlapping_areas()[0])

func snap(hook):
	conteneur_liquide = hook
	launch_snap_tween(hook)

func launch_snap_tween(area):
	var tween = create_tween()

	var target_position : Vector2 = area.global_position-$Sortie.position*scale.x
	tween.tween_property(self , "global_position" , target_position , 0.5).set_trans(Tween.TRANS_CUBIC)
	
	var target_rotation = area.rotation
	
	if(rotation > PI):
		target_rotation += 2 * PI
	
	tween.parallel().tween_property(self , "rotation" , target_rotation , 0.5).set_trans(Tween.TRANS_CUBIC)

func send_liquide(id_liquide):
	if conteneur_liquide.sprite:
		conteneur_liquide.add_liquide(id_liquide)
	else :
		$Sprite2D.frame = 1
