extends Area2D
class_name Dragable;

var can_grab = true
var grabbed = false
var grabbed_offset := Vector2()
var grab_position := Vector2.ZERO
var release_pick_to_release:=false

const vitesse_rotation:= 2.0

func _on_input_event(_viewport, event, _shape_idx):
	var global_mouse_position = get_global_mouse_position()
	if event.is_action_pressed("pick") and can_grab and not Id_pieces.drag_and_drop_taken:
		grab()
	if event.is_action_released("pick") and release_pick_to_release:
		release()

func _process(delta):
	if grabbed:
		if get_global_mouse_position().distance_squared_to(grab_position)>10.0:
			release_pick_to_release = true
		global_position = get_global_mouse_position() + grabbed_offset
		if Input.is_action_pressed("rotate_left"):
			rotation-=delta*vitesse_rotation
		if Input.is_action_pressed("rotate_right"):
			rotation+=delta*vitesse_rotation

func grab():
	var global_mouse_position = get_global_mouse_position()
	Id_pieces.drag_and_drop_taken = true
	grabbed = true
	grabbed_offset = global_position - global_mouse_position
	grab_position = global_mouse_position
	release_pick_to_release = false

func release():
	Id_pieces.drag_and_drop_taken = false
	grabbed = false
