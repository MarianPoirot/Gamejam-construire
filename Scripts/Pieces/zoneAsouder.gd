extends CollisionPolygon2D

signal soude

@export var maxSoudures : int
var nbSoudures : int
var texture = load("res://Assets/Sprites/Soudure.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	nbSoudures = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func createSoudure(pos):
	var newSoudure = Sprite2D.new()
	newSoudure.texture = texture
	newSoudure.position = pos
	nbSoudures += 1
	if nbSoudures >= maxSoudures :
		emit_signal("soude")


func _on_input_event(_viewport, event, _shape_idx):
	pass # Replace with function body.
