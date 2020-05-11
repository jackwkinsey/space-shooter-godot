extends Node

func _on_StartButton_pressed():
	var error_code = get_tree().change_scene("res://Scenes/World.tscn")
	
	if error_code != 0:
		print("Error while loading scene: " + str(error_code))
