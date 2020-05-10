extends Area2D

const HitEffect = preload("res://Scenes/HitEffect.tscn")

onready var bullet_sound = $BulletSound

export(int) var SPEED = 200

func _ready():
	bullet_sound.play()
	
func _physics_process(delta):
	position.x += SPEED * delta

func create_hit_effect():
	var hit_effect = HitEffect.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	field.add_child(hit_effect)
	hit_effect.global_position = global_position
	hit_effect.get_node("HitParticles").emitting = true

# Signals
func _on_Bullet_area_entered(_area):
	create_hit_effect()
