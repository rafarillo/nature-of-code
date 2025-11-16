extends Node2D

func _ready() -> void:
    DrawMain()

func _draw() -> void:
    pass

func DrawMain() -> void:
    while true:
        await get_tree().create_timer(0.01).timeout
        queue_redraw()
