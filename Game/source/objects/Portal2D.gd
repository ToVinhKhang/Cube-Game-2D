tool
extends Area2D

export var next_scene: PackedScene

onready var anim_player: AnimationPlayer = $AnimationPlayer

func _get_configuration_warning() -> String:
	return "The next scene can't be empty" if not next_scene else ""

func teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)

func _on_body_entered(body: PhysicsBody2D) -> void:
	teleport()
