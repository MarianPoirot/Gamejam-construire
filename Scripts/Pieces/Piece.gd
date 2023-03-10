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
var nbSoudure := 0
var maxSoudure := 4

func _ready():
	if not Id_pieces.state_dependencies[id]:
		rotation = randf_range(0, 2*PI)
	connect("just_snapped", func(): EventBus.emit_signal("piece_got_snapped", id))

func release():
	super.release()
	try_snap()


func try_snap():
	if not depandancies_metted():
		return
	
	for area in $Ancre.get_overlapping_areas():
		if area is Ancre and area.id==self.id and abs(angle_difference(area.rotation, rotation))<PI/6.0:
			snap(area)
			

func depandancies_metted():
	return Id_pieces.dependancies[id].all(func (dep): return Id_pieces.state_dependencies[dep])

func snap(area):
	is_snapped = true
	emit_signal("just_snapped")
	can_grab = false
	launch_snap_tween(area)
	if can_activate_ancre:
		activate_ancre()
	Id_pieces.state_dependencies[id] = true
	area.desactivate()

func launch_snap_tween(area):
	var tween = create_tween()

	var target_position : Vector2 = area.global_position-$Ancre.position*scale.x
	tween.tween_property(self , "global_position" , target_position , 0.5).set_trans(Tween.TRANS_CUBIC)
	
	var target_rotation = area.rotation
	
	if(rotation > PI):
		target_rotation += 2 * PI
	
	tween.parallel().tween_property(self , "rotation" , target_rotation , 0.5).set_trans(Tween.TRANS_CUBIC)

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

func souder():
	nbSoudure += 1
	if nbSoudure >= maxSoudure:
		can_activate_ancre = true

func _on_zone_asouder_1_c_est_bon_c_est_soude():
	souder()
func _on_zone_asouder_2_c_est_bon_c_est_soude():
	souder()
func _on_zone_asouder_3_c_est_bon_c_est_soude():
	souder()
func _on_zone_asouder_4_c_est_bon_c_est_soude():
	souder()


func update_zas_enablility(idZAS):
	if id == Id_pieces.id_pieces.coque_avant_inf_l:
		match idZAS:
			1:
				pass
			2:
				$ZoneAsouderDroite/zone.disabled = false
			3:
				$ZoneAsouderGauche/zone.disabled = false
			4:
				$ZoneAsouderHorizontale/zone.disabled = false
			5:
				$ZoneAsouderVerticale/zone.disabled = false

func _on_just_snapped():
	update_zas_enablility(1) # coque bas gauche
func _on_coque_inf_avant_l_3_just_snapped():
	update_zas_enablility(2) # coque milieu
func _on_coque_inf_avant_l_2_just_snapped():
	update_zas_enablility(3)  # coque bas droite
func _on_coque_inf_avant_l_4_just_snapped():
	update_zas_enablility(4) # coque haut gauche
func _on_coque_inf_avant_l_5_just_snapped():
	update_zas_enablility(5) # coque haut droite
