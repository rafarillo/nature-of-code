extends Node2D
@export var _increment: float = 0.1
@export var _start: float = 0.0

var screeSize: Vector2
var noise := FastNoiseLite.new()
var xoff := 0.0
var yoff := 10.0

func _ready() -> void:
    screeSize = DisplayServer.window_get_size()
    noise.noise_type = FastNoiseLite.TYPE_PERLIN
    DrawMain()

func _draw() -> void:
    # particle_perlin_noise()

    yoff = _start
    for x in range(0, screeSize.x - 1):
        var p1: Vector2 = Vector2(x,  remap(noise.get_noise_1d(yoff), -1.0, 1.0, 0.0, screeSize.y))
        yoff += _increment
        var p2: Vector2 = Vector2(x+1, remap(noise.get_noise_1d(yoff), -1.0, 1.0, 0.0, screeSize.y))
        # draw_circle(p1, 1, Color.WHITE)
        draw_line(p1, p2, Color.WHITE, 1.0)
    _start += _increment
        

func DrawMain():
    while true:
        await get_tree().create_timer(0.01).timeout
        queue_redraw()


func particle_perlin_noise():
    var x:float = noise.get_noise_1d(xoff) * screeSize.x
    var y:float = noise.get_noise_1d(yoff) * screeSize.y

    draw_circle(Vector2(x, y) + screeSize * 0.5, 50, Color.RED)

