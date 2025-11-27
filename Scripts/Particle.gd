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
@export var Radius: float = 64:
    set(new_value):
        Radius = new_value
    get:
        return Radius

var _acc:Vector2 = Vector2.ZERO
var Mass: float:
    get:
        return _mass

func ApplyForce(dt:float):
    _acc = Force / _mass
    Vel += _acc * dt
    self.position += Vel * dt + _acc * dt * dt * 0.5