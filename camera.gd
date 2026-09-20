extends Camera2D

var start = Vector2.ZERO
@export_range(0.0, 1.0) var lane: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	start = screen_size/2
	self.position = start


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../car".crashed:
		return
	var screen_size: Vector2 = get_viewport_rect().size
	self.position = start
	$"../background".skew = deg_to_rad(lerp(-40, 0, lane))
	$"../background".position = Vector2(
		screen_size.x / 2.0 + lerp(300, 0, lane),
		screen_size.y / 2.0
	)

	if Input.is_key_pressed(KEY_A):
		lane -= 0.05
	elif Input.is_key_pressed(KEY_D):
		lane += 0.05
	if lane > 1.9:
		lane = 1.9
	if lane < -0.5:
		lane = -0.5
