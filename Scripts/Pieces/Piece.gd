extends Dragable
class_name Piece

@export var id:Id_pieces.id_pieces
signal just_snapped
@export var can_activate_ancre := true : 
	set(value):
		can_activate_ancre = value
		if value:
			activate_ancre()
			
var is_snapped := false

func _ready():
	if not Id_pieces.state_dependencies[id]:
		rotation = randf_range(0, 2*PI)

func release():
	super.release()
	try_snap()


func try_snap():
	if not depandancies_metted():
		return
	
	print("Self: ", self)
	for area in $Ancre.get_overlapping_areas():
		if area is Ancre and area.id==self.id and abs(angle_difference(area.rotation, rotation))<PI/6.0:
			snap(area)
			

func depandancies_metted():
	return Id_pieces.dependancies[id].all(func (dep): return Id_pieces.state_dependencies[dep])

func snap(area):
	is_snapped = true
	emit_signal("just_snapped")
	can_grab = false
	self.global_position=area.global_position-$Ancre.position*scale.x
	self.rotation = area.rotation
	if can_activate_ancre:
		activate_ancre()
	Id_pieces.state_dependencies[id] = true
	area.desactivate()

func activate_ancre():
	for ancre in $recepteurAncre.get_children():
		ancre.activate()

func _on_zone_asouder_c_est_bon_c_est_soude():
	can_activate_ancre = true

func _on_ancre_combustible_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("pick") and not Id_pieces.drag_and_drop_taken:
		match $"Chaudière".frame:
			0: 
				$"Chaudière".frame = 1
				Id_pieces.state_dependencies[Id_pieces.id_pieces.chaudiere_ouverte]=true
			1: 
				$"Chaudière".frame = 0
				Id_pieces.state_dependencies[Id_pieces.id_pieces.chaudiere_ouverte]=false
			2: $"Chaudière".frame = 3


func angle_difference(angle1, angle2):
	var diff = angle2 - angle1
	return diff if abs(diff) < PI else diff + (2*PI * -sign(diff))
