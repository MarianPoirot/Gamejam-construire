extends Button

var bomberman = load("res://Scenes/Esteban/bomberman.tscn")
var flipper = load("res://Scenes/Esteban/flipper_inv.tscn")
var flipper_exist = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func spawn():
	var new_bomberman = bomberman.instantiate()
	new_bomberman.position = Vector2(700,-500)
	self.add_child(new_bomberman)
	if not flipper_exist:
		flipper_exist = true
		var flipper_droit = flipper.instantiate()
		flipper_droit.position = Vector2(800, 50)
		self.add_child(flipper_droit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_down():
	if not $"../../VordtOfTheBorealMeme".playing:
		$"../../VordtOfTheBorealMeme".play()
	spawn()

