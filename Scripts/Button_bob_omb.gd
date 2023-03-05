extends Button

var bob_omb = load("res://Scenes/Esteban/bob_omb.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func spawn():
	var new_bob_omb = bob_omb.instantiate()
	new_bob_omb.position = Vector2(-300,-500)
	self.add_child(new_bob_omb)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	spawn()
