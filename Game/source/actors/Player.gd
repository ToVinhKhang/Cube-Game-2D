extends Actor

export var stomp_impulse: = 600.0

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calc_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	die()

func get_movement() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move left"), 
		-Input.get_action_strength("jump") if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

func calc_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jump_condition: bool) -> Vector2:
	var velocity: = linear_velocity
	
	velocity.x = speed.x * direction.x
	
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	
	if is_jump_condition:
		velocity.y = 0.0
	
	return velocity
	
func calc_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	
	return Vector2(linear_velocity.x, stomp_jump)

func _physics_process(delta: float) -> void:
	var is_jump_condition: = Input.is_action_just_pressed("jump") and _velocity.y < 0.0
	var direction: = get_movement()
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	
	_velocity = calc_velocity(_velocity, direction, speed, is_jump_condition)
	_velocity = move_and_slide_with_snap(_velocity, snap, floor_normal, true)

func die() -> void:
	PlayerProcess.death_numbers += 1
	queue_free()
