extends Node

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_game()
	if Input.is_action_just_pressed("ui_cancel"):
		quit_game()

func start_game():
	var error_code = get_tree().change_scene("res://Scenes/World.tscn")
	
	if error_code != 0:
		print("Error while loading scene: " + str(error_code))

func quit_game():
	get_tree().quit();
