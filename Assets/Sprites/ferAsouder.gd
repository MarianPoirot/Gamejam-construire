extends Dragable


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$Chalumeau.play("off")
	updateCable()
	
	
func updateCable():
		var points = $cable.get_points()
		var ferAsouder = self.global_position
		var corner = get_window().size
		$cable.set_point_position(1, Vector2(corner.x - ferAsouder.x - points[0].x,
											corner.y - ferAsouder.y - points[0].y))
	
func _process(delta):
	super._process(delta)
	if grabbed:
		updateCable()


func _on_input_event(_viewport, event, _shape_idx):
	super._on_input_event(_viewport, event, _shape_idx)
	if Input.is_action_pressed("secondary_action"):
		$Chalumeau.play("on")
		for area in $WeldingArea.get_overlapping_areas():
			if area.has_method("souder"):
				if area.get_parent().is_snapped:
					area.souder($WeldingArea/WeldingCollision.global_position)
	else:
		$Chalumeau.play("off")
