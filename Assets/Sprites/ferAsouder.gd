extends Dragable


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_input_event(_viewport, event, _shape_idx):
	if Input.is_action_pressed("secondary_action"):
		get_global_mouse_position()
