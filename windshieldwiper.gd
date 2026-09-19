extends Sprite2D

var screen_size: Vector2
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size
	var texture_size: Vector2 = self.texture.get_size()
	self.position = Vector2(screen_size.x/4*3, screen_size.y+250)

	self.rotation_degrees += direction * 300 * delta

	if self.rotation_degrees <= -135:
		self.rotation_degrees = -135
		direction = 1
	elif self.rotation_degrees >= 45:
		self.rotation_degrees = 45
		direction = -1
