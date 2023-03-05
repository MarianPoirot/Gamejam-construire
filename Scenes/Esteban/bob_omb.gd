extends RigidBody2D

var bob_ombardement = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (bob_ombardement == true):
		move_local_y(1)


func _on_button_bob_omb_button_down():
	bob_ombardement = true
	
