extends Actor

export var score: = 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x
	
func _on_Detector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("Detector").global_position.y:
		return
	
	die()

func _physics_process(delta: float) -> void:	
	_velocity.x *= -1 if is_on_wall() else 1
	
	_velocity.y = move_and_slide(_velocity, floor_normal).y

func die() -> void:
	queue_free()
	PlayerProcess.score += score
