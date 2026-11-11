extends Node2D

var enemy_scene = preload("res://enemy.tscn")

var game_over_triggered: bool = false


func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)

	var timer = Timer.new()
	add_child(timer)

	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start()


func _create_enemy() -> void:
	if game_over_triggered:
		return

	var new_enemy = enemy_scene.instantiate()
	get_parent().get_node("enemies").add_child(new_enemy)


func _the_end(body: Area2D) -> void:
	if body is enemy and not game_over_triggered:
		game_over_triggered = true

		# Show the Game Over menu
		var game_over_menu = get_parent().get_node("GUI/Game_over")
		game_over_menu.show()

		# Pause the game
		get_tree().paused = true
