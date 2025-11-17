extends Node2D

@export var sprite: Sprite2D

var screenSize: Vector2
var _img: Image
var _particlePosition: Vector2
var _texture: ImageTexture

func _ready() -> void:
	_img = sprite.texture.get_image()
	_img.fill(Color.BLACK)
	_texture = ImageTexture.create_from_image(_img)
	sprite.texture = _texture
	_particlePosition = Vector2(_img.get_width(), _img.get_height()) * 0.5
	screenSize = DisplayServer.window_get_size()
	DrawMain()

func _draw() -> void:
	SimulateRandomWalk()
	pass

func DrawMain() -> void:
	while true:
		await get_tree().create_timer(0.01).timeout
		queue_redraw()

func SimulateRandomWalk() -> void:
	PaintParticle(_particlePosition, Color.DARK_RED)
	var randNum = randi_range(0, 3)
	match randNum:
		0:
			_particlePosition.x += 1
		1:
			_particlePosition.x -= 1
		2:
			_particlePosition.y += 1
		3:
			_particlePosition.y -= 1
		_:
			print("Value doesn't have a match")
	
	PaintParticle(_particlePosition, Color.WHITE)
	_texture = ImageTexture.create_from_image(_img)
	sprite.texture = _texture

func PaintParticle(position: Vector2, color: Color):
	for i in range(-1, 1, 1):
		for j in range(-1, 1, 1):
			var newPosition: Vector2 = Vector2(position.x + i, position.y + j)
			_img.set_pixelv(newPosition, color)
	
