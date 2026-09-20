extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = get_viewport_rect().size
	self.size = screen_size
	self.position = Vector2.ZERO
	if $"../car".crashed:
		self.visible = true
		self.text = "You Crashed on Hwy 417 in Ottawa after successfully dodging %s cars" % str($"../car".score)
	else:
		self.visible = false
