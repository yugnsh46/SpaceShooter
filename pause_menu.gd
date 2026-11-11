extends Control

var is_paused: bool = false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false  #pause menu visibility = false nahi dikhra intialy jab game scene started hai


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and not event.is_echo():

		# Don't open Pause Menu when Game Over is visible
		var game_over = get_parent().get_node_or_null("Game_over")

		if game_over != null and game_over.visible:
			return

		set_is_paused(not get_tree().paused)  #not false = true 


func set_is_paused(value: bool) -> void:
	is_paused = value
	get_tree().paused = value
	visible = value  # true = pause menu appears , false = disappears


func _on_resume_button_pressed() -> void:
	set_is_paused(false)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
