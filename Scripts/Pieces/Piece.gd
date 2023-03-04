extends Dragable

@export var id:Id_pieces.id_pieces

func release():
	super.release()
	try_snap()


func try_snap():
	if not depandancies_metted():
		return
	
	print("Self: ", self)
	for area in $Ancre.get_overlapping_areas():
		print(area)
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
