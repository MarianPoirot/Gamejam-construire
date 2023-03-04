extends Area2D

class_name Hook

@export var id_liquides: Array[Id_pieces.id_pieces]

@export var sprites_remplissage:Array[Texture2D]
var niveau:=0
@onready var niveauMax = min(sprites_remplissage.size(), id_liquides.size())

func add_liquide(id_liquide:Id_pieces.id_pieces):
	if id_liquides.has(id_liquide) and niveau <= niveauMax:
		(get_child(0) as Sprite2D).texture = sprites_remplissage[niveau]
		niveau += 1
