extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.piece_got_snapped.connect(fill_chaudière)

func fill_chaudière(id):
	if id == 4 :
		frame = 2
