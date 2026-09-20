extends Sprite2D

var time = -2.5
var speed_scale = 0.75
var crashed = false
var score = 0
@export var scale_scale = 1.25
@export_range(0.0, 1.0) var lane: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	self.position = screen_size/2
	self.scale = Vector2.ZERO
	self.visible = false

func bg_relative(vec: Vector2) -> Vector2:
	var screen_size = get_viewport_rect().size
	return vec + ($"../background".position-screen_size/2)*2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * speed_scale
	if $"../car".crashed:
		self.visible = false
		return
	if time < 0:
		return
	if time > 0:
		self.visible = true
	var screen_size = get_viewport_rect().size
	var t = lerp(0.0, 0.6, lane) * 3.0

	var end_pos: Vector2

	if t < 1.0:
		end_pos = lerp(
			bg_relative(Vector2(0, screen_size.y * 4/5)),
			bg_relative(Vector2(0, screen_size.y)),
			t
		)
	elif t < 2.0:
		end_pos = lerp(
			bg_relative(Vector2(0, screen_size.y)),
			bg_relative(Vector2(screen_size.x, screen_size.y)),
			t - 1.0
		)
	else:
		end_pos = lerp(
			bg_relative(Vector2(screen_size.x, screen_size.y)),
			bg_relative(Vector2(screen_size.x, screen_size.y * 4/5)),
			t - 2.0
		)
	self.position = lerp($"../background".position, end_pos, pow(time, 2))
	self.scale = Vector2.ONE * pow(time, 2) * speed_scale * scale_scale
	
	self.rotation = lerp(0, 1, lerp(0.3, -0.3, lane))
	if self.position.x > $"../background".position.x:
		self.flip_h = true
	else:
		self.flip_h = false
	
	if time > 2:
		self.scale = Vector2.ZERO
		time = 0
		lane = randf_range(0.0, 1.0)
		crashed = false
		score += 1
	
	if self.position.y > $"../Camera2D".global_position.y + screen_size.y/2 and abs(self.position.x - $"../Camera2D".global_position.x) < screen_size.x/3 and not crashed:
		crashed = true
