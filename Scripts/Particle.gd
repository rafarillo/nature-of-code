class_name Particle
extends Node2D

@export var _mass:float = 1.0
@export var Force: Vector2 = Vector2.ZERO:
    set(new_value):
        Force = new_value
    get:
        return Force
var Vel:Vector2 =  Vector2.ZERO:
    set(new_value):
        Vel = new_value
    get:
        return Vel

var _acc:Vector2 = Vector2.ZERO

func ApplyForce(dt:float):
    _acc = Force / _mass
    Vel += _acc * dt
    self.position += Vel * dt + _acc * dt * dt * 0.5