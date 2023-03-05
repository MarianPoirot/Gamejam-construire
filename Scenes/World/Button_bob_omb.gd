extends Button

var bob_omb = load("res://Scenes/Esteban/bob_omb.tscn")
var flipper = load("res://Scenes/Esteban/flipper.tscn")
var flipper_exist = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func spawn():
	print("ça marche")
	var new_bob_omb = bob_omb.instantiate()
	new_bob_omb.position = Vector2(-300,-500)
	self.add_child(new_bob_omb)
	if not flipper_exist:
		flipper_exist = true
		var flipper_droit = flipper.instantiate()
		flipper_droit.position = Vector2(-400, -50)
		self.add_child(flipper_droit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_down():
	print("ça marche")
	spawn()

