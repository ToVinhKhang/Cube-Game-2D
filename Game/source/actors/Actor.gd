extends KinematicBody2D
class_name Actor

const floor_normal: = Vector2.UP

var _velocity: = Vector2.ZERO

export var gravity: = 3000.0
export var speed: = Vector2(400.0, 500.0)

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
