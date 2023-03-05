extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("piece_got_snapped", func (id):play())
