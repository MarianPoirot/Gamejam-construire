extends Area2D

const vitesse:=1.0

func _ready():
	Id_pieces.connect("tapis_roulant_descendre", descendre)
	Id_pieces.connect("tapis_roulant_monter", monter)

func _process(_delta):
	if Input.is_action_pressed("descendre_tapis"):
		descendre()
	elif Input.is_action_pressed("monter_tapis"):
		monter()

func deplacer(sens:int):
	for c in get_overlapping_areas():
		c.position.y += sens * vitesse

func monter():
	deplacer(-1)

func descendre():
	deplacer(1)


func _on_haut_area_entered(area):
	area.position.y+=($CollisionShape2D.shape.size.y)*scale.y


func _on_bas_area_entered(area):
	area.position.y-=($CollisionShape2D.shape.size.y)*scale.y


var area_diminuees:Array[Node2D] = []

func _on_area_exited(area:Node2D):
	if area_diminuees.has(area):
		area.scale*=2
		area_diminuees.erase(area)


func _on_grossissement_area_entered(area):
	if area_diminuees.has(area):
		return
	area_diminuees.push_back(area)
	area.scale*=0.5
