extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	self.scale = Vector2.ONE*5
	self.connect("pressed", self._on_button_pressed)

func _on_button_pressed():
	$"../car".crashed = false
	$"../car".score = 0
	$"../car".time = -2.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = get_viewport_rect().size
	self.position = screen_size/2 + Vector2(-self.size.x/2*5, 100)
	if $"../car".crashed:
		self.visible = true
	else:
		self.visible = false
	
