extends Node2D

@export var _particles: Array[Particle]
@export var _gravityIntensity: float = 10000.0
@export var _windForce: Vector2 = Vector2.RIGHT
var _frictionConstant = 0.1

func _process(delta: float) -> void:
	for particle in _particles:
		particle.Force = Vector2.DOWN * _gravityIntensity * particle.Mass
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			particle.Force += _windForce

		var heighDiff:float = particle.position.y - get_window().size.y + particle.Radius
		if heighDiff >= 0:
			particle.Vel.y *= -1.0
			particle.position.y = get_window().size.y - particle.Radius
			var normal = particle.Mass
			var frictionForce = (-1) * particle.Vel * normal * _frictionConstant
			particle.Force += frictionForce
			# Other implementation of friction
			# particle.Vel *= 0.95

		if particle.position.x >= get_window().size.x - particle.Radius or particle.position.x <= particle.Radius:
			particle.Vel.x *= -1.0
		particle.ApplyForce(delta)
