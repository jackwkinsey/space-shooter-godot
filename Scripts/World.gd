extends Node

onready var score_label = $ScoreLabel
onready var star_particles = $StarParticles

var score = 0 setget set_score

func set_score(value):
	score = value
	update_score_label()

func _ready():
	star_particles.emitting = true

func update_score_label():
	score_label.text = "Score: " + str(score)

func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

# Signals
func _on_Enemy_enemy_killed(points):
	self.score += points

func _on_Ship_ship_destroyed():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	var error_code = get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
	if error_code != 0:
		print("Error while loading scene: " + str(error_code))
