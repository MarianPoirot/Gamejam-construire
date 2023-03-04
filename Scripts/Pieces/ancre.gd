extends Area2D

@export var id:Id_pieces.id_pieces
@export var disable:=true

func _ready():
	$CollisionShape2D.disabled=disable

func activate():
	$CollisionShape2D.disabled=false

func desactivate():
	$CollisionShape2D.disabled=true
