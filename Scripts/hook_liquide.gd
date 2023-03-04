extends Area2D

class_name Hook

@export var id_liquides: Array[Id_pieces.id_pieces]
@export var sprite_path:NodePath
@onready var sprite := get_node(sprite_path)

var niveau:=0
@onready var niveauMax = id_liquides.size()

func add_liquide(id_liquide:Id_pieces.id_pieces):
	if id_liquides.has(id_liquide) and niveau < niveauMax:
		sprite.frame += 1
		niveau += 1
