extends Area2D

const ExplosionEffect = preload("res://Scenes/ExplosionEffect.tscn")

export(int) var SPEED = 30
export(int) var POINTS = 100
export(int) var HEALTH = 3

signal enemy_killed

func _ready():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		connect("enemy_killed", main, "_on_Enemy_enemy_killed")

func _process(delta):
	position.x -= SPEED * delta;

func _exit_tree():
	var explosion_effect = ExplosionEffect.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	
	field.call_deferred("add_child", explosion_effect)
	explosion_effect.global_position = global_position

# Signals
func _on_Enemy_body_entered(body):
	body.queue_free()
	
	HEALTH -= 1
	if HEALTH <= 0:
		emit_signal("enemy_killed", POINTS)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
