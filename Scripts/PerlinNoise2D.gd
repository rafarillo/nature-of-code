extends Node2D

@export var sprite: Sprite2D
@export var _increment:float = 0.1

var screenSize: Vector2
var noise := FastNoiseLite.new()

func _ready() -> void:
	screenSize = DisplayServer.window_get_size()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	DrawMain()

func _draw() -> void:
	DrawPerlinNoise()
	pass

func DrawMain() -> void:
	while true:
		await get_tree().create_timer(0.01).timeout
		queue_redraw()

func DrawPerlinNoise():
	var img := sprite.texture.get_image()
	
	var xoff := 0.0
	for i in range(0, img.get_width()):
		var yoff := 0.0
		for j in range(0, img.get_height()):
			var randomNoise: float = remap(noise.get_noise_2d(xoff, yoff), -1.0, 1.0, 0.0, 1.0)
			var color:Color = Color(randomNoise, randomNoise, randomNoise)
			img.set_pixel(i, j, color)
			# draw_circle(position, 1.0, color)
			yoff += _increment
		xoff += _increment
	var tex := ImageTexture.create_from_image(img)
	sprite.texture = tex
