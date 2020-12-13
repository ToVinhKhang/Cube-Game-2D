extends Node

signal score_updated
signal player_died
signal reset

var score: = 0 setget set_score
var death_numbers: = 0 setget set_death_numbers

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func set_death_numbers(value: int) -> void:
	death_numbers = value
	emit_signal("player_died")

func reset():
	self.score = 0
	self.death_numbers = 0
	emit_signal("reset")
