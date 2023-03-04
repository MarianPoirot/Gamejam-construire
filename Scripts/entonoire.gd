extends Dragable


var conteneur_liquide:Node2D=null

func grab():
	super.grab()
	conteneur_liquide = null

func release():
	super.release()
	try_snap()

func try_snap():
	if not $Sortie.get_overlapping_areas().is_empty():
		snap($Sortie.get_overlapping_areas()[0])

func snap(hook):
	self.global_position=hook.global_position-$Sortie.position*scale.x
	conteneur_liquide = hook

