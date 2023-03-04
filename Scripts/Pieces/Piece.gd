extends Area2D

@export var id:Id_pieces.id_pieces
var can_grab = true
var grabbed = false
var grabbed_offset = Vector2()

const vitesse_rotation:= 2.0

func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("pick") and can_grab and not Id_pieces.drag_and_drop_taken:
		Id_pieces.drag_and_drop_taken = true
		grabbed = true
		grabbed_offset = global_position - get_global_mouse_position()
	if event.is_action_released("pick"):
		Id_pieces.drag_and_drop_taken = false
		grabbed = false
		try_snap()

func _process(delta):
	if grabbed:
		if Input.is_action_pressed("pick"):
			global_position = get_global_mouse_position() + grabbed_offset
		if Input.is_action_pressed("rotate_left"):
			rotation-=delta*vitesse_rotation
		if Input.is_action_pressed("rotate_right"):
			rotation+=delta*vitesse_rotation
		

func try_snap():
	if not depandancies_metted():
		return
	
	for area in $Ancre.get_overlapping_areas():
		if area.id==self.id and abs(fmod(area.rotation, 2*PI) - fmod(rotation, 2*PI))<PI/10.0:
			snap(area)

func depandancies_metted():
	return Id_pieces.dependancies[id].all(func (dep): return Id_pieces.state_dependencies[dep])

func snap(area):
	can_grab = false
	self.global_position=area.global_position-$Ancre.position*scale.x
	self.rotation = area.rotation
	for ancre in $recepteurAncre.get_children():
		ancre.activate()
	
	Id_pieces.state_dependencies[id] = true
