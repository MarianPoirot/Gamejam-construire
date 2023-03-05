extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("flipper_gauche"):
		position.y = position.y - 60
	if Input.is_action_pressed("flipper_gauche"):
		if rotation_degrees < 30:
			rotation += 30 * delta
	if Input.is_action_just_released("flipper_gauche"):
		set_rotation_degrees(0)
		position.y = position.y + 60
		

