extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation_degrees < 0 || rotation_degrees > 0:
		rotation_degrees = 0
	if linear_velocity.y < 0 || linear_velocity.y > 0 :
		linear_velocity.y =0
		

