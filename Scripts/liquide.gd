extends Dragable

@export var id:Id_pieces.id_pieces

func release():
	super.release()
	if not get_overlapping_areas().is_empty():
		get_overlapping_areas().front().get_parent().send_liquide(id)
