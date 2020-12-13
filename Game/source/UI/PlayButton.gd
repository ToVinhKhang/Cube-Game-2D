tool
extends Button

export(String, FILE) var next_path: = ""

func _on_button_up():
	PlayerProcess.reset()
	get_tree().change_scene(next_path)

func _get_configuration_warning() -> String:
	return "Path not found!" if next_path == "" else ""
