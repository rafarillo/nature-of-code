extends Node2D

@export var _particle: Particle
@export var _gravityIntensity: float = 10000.0
@export var _windForce: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	_particle.Force = Vector2.DOWN * _gravityIntensity
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_particle.Force += _windForce
	_particle.ApplyForce(delta)

	if _particle.position.y >= get_window().size.y:
		_particle.Vel.y *= -1.0
	if _particle.position.x >= get_window().size.x or _particle.position.x <= 0:
		_particle.Vel.x *= -1.0
