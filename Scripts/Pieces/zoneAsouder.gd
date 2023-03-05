extends Area2D

signal c_est_bon_c_est_soude

@export var maxSoudures := 10
var weldCounter :=0

@export var weldSpeed := 0.5
@export var soudureZindex := 0
var nbSoudures : int
var completed := false
var texture = load("res://Assets/Sprites/Soudure.png")
var Soudure = load("res://Scenes/Pieces/soudure.tscn")
var alpha := Color.WHITE

# Called when the node enters the scene tree for the first time.
func _ready():
	nbSoudures = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		

func souder(pos):
	if !completed:
		weldCounter += 1
		if weldCounter >= 1/weldSpeed:
			createSoudure(pos)
			weldCounter = 0

func fondre_les_soudures():
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1.6)
	


func createSoudure(pos):
	var newSoudure = Soudure.instantiate()
	nbSoudures += 1
	newSoudure.z_index = soudureZindex
	self.add_child(newSoudure)
	newSoudure.global_position = pos
	if nbSoudures >= maxSoudures :
		emit_signal("c_est_bon_c_est_soude")
		completed = true
		fondre_les_soudures()
