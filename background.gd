extends Sprite2D

var scale_factor
var _frame_count: int = 0


func _ready() -> void:
	get_viewport().connect("size_changed", _update_background_scale)
	_update_background_scale()

func _update_background_scale() -> void:
	if not texture:
		return

	var screen_size: Vector2 = get_viewport_rect().size
	var texture_size: Vector2 = self.texture.get_size()
	
	

	# Add extra height coverage needed to compensate for the vertical offset
	var required_height: float = screen_size.y + (abs(self.offset.y) * 2.0)
	

	scale_factor = max(
		screen_size.x / texture_size.x,
		required_height / texture_size.y
	)*1

	self.scale = Vector2(scale_factor, scale_factor)
	self.position = Vector2(
		screen_size.x / 2.0,
		screen_size.y / 2.0
	)
	
func _process(delta: float) -> void:
	scale *= 1.02
	_frame_count += 1
	if _frame_count % 40 == 0:
		_update_background_scale()
