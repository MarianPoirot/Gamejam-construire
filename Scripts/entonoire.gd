extends Dragable


var conteneur_liquide:Hook=null

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

func send_liquide(id_liquide):
	if conteneur_liquide:
		conteneur_liquide.add_liquide(id_liquide)
