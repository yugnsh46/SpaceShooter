extends Control


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_button_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game_manager.tscn")


func _on_button_quit_pressed() -> void:
	get_tree().quit()
