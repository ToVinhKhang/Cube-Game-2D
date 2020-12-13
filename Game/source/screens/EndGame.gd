extends Control

onready var label: Label = get_node("Label")

func _ready() -> void:
	label.text = label.text % [PlayerProcess.score, PlayerProcess.death_numbers]
	
