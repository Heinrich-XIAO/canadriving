extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = get_viewport_rect().size
	self.position = Vector2.ZERO
	self.size = screen_size
	self.text = "A: left\nD: right\nScore: %s" % str($"../car".score)
