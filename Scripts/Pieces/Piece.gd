extends Area2D

@export var id:Id_pieces.id_pieces
var can_grab = true
var grabbed = false
var grabbed_offset = Vector2()

func _ready():
	pass # Replace with function body.

func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("pick") and can_grab:
		grabbed = true
		grabbed_offset = position - get_global_mouse_position()
	if event.is_action_released("pick"):
		grabbed = false
		try_snap()

func _process(_delta):
	if Input.is_action_pressed("pick") and grabbed:
		position = get_global_mouse_position() + grabbed_offset

func try_snap():
	if not depandancies_metted():
		return
	
	for area in $Ancre.get_overlapping_areas():
		if area.id==self.id:
			snap(area)

func depandancies_metted():
	return Id_pieces.dependancies[id].all(func (dep): return Id_pieces.state_dependencies[id])

func snap(area):
	can_grab = false
	self.position=area.position-$Ancre.position
	for ancre in $recepteurAncre.get_children():
		ancre.activate()
	
	Id_pieces.state_dependencies[id] = true
