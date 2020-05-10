extends Node

onready var score_label = $ScoreLabel
onready var star_particles = $StarParticles

var score = 0 setget set_score

func set_score(value):
	score = value
	score_label.text = "Score: " + str(score)

func _ready():
	star_particles.emitting = true

# Signals
func _on_Enemy_enemy_killed(points):
	self.score += points
