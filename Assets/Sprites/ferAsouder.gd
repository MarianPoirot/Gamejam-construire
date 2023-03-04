extends Dragable


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_input_event(_viewport, event, _shape_idx):
	super._on_input_event(_viewport, event, _shape_idx)
	if Input.is_action_pressed("secondary_action"):
		for area in $WeldingArea.get_overlapping_areas():
			if area.has_method("souder"):
				if area.get_parent().is_snapped:
					area.souder($WeldingArea/WeldingCollision.global_position)
					
				
		
