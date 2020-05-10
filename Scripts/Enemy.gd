extends Area2D

const ExplosionEffect = preload("res://Scenes/ExplosionEffect.tscn")

export(int) var SPEED = 30;
export(int) var HEALTH = 3;

func _process(delta):
	position.x -= SPEED * delta;

func _exit_tree():
	var explosion_effect = ExplosionEffect.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	
	field.add_child(explosion_effect)
	explosion_effect.global_position = global_position

# Signals
func _on_Enemy_body_entered(body):
	body.queue_free()
	
	HEALTH -= 1
	if HEALTH <= 0:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
