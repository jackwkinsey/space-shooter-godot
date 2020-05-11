extends Node

onready var highscore_label = $HighscoreLabel

func _ready():
	set_highscore_label()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_game()
	if Input.is_action_just_pressed("ui_cancel"):
		go_to_main_menu()

func start_game():
	var error_code = get_tree().change_scene("res://Scenes/World.tscn")
	
	if error_code != 0:
		print("Error while loading scene: " + str(error_code))

func go_to_main_menu():
	var error_code = get_tree().change_scene("res://Scenes/StartMenu.tscn")
	
	if error_code != 0:
		print("Error while loading scene: " + str(error_code))

func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highscore_label.text = "Highscore: " + str(save_data.highscore)
