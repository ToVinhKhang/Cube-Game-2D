extends Control

onready var scene_tree: = get_tree()
onready var menu_overlay: ColorRect = get_node("MenuOverlay")
onready var score: Label = get_node("Label")
onready var pause_title: Label = get_node("MenuOverlay/Title")
#onready var main_menu_buttons: Button = get_node("MenuOverlay/VBoxContainer/MainMenuButton")

var pause_state: = false setget set_pause

func _ready() -> void:
	PlayerProcess.connect("score_updated", self, "updated_interface")
	PlayerProcess.connect("player_died", self, "_on_player_died")
	PlayerProcess.connect("reset", self, "_on_player_reset")	
	updated_interface()
	
func _on_player_died() -> void:
	self.pause_state = true
	pause_title.text = "You died!"
	
func _on_player_reset() -> void:
	self.pause_state = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_title.text != "You died!":
		self.pause_state = not self.pause_state

func updated_interface() -> void:
	score.text = "Score: %s" % PlayerProcess.score

func set_pause(value: bool) -> void:
	pause_state = value
	scene_tree.paused = value
	menu_overlay.visible = value
