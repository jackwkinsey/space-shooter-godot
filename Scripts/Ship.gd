extends Area2D

const Bullet = preload("res://Scenes/Bullet.tscn")
const ExplosionEffect = preload("res://Scenes/ExplosionEffect.tscn")

export(int) var SPEED = 100

signal ship_destroyed
	
func _process(delta):
	if Input.is_action_just_pressed("fire_bullet"):
		fire_bullet()
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta

func fire_bullet():
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	field.add_child(bullet)
	bullet.global_position = global_position

func _exit_tree():
	var explosion_effect = ExplosionEffect.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	
	field.call_deferred("add_child", explosion_effect)
	explosion_effect.global_position = global_position
	
	emit_signal("ship_destroyed")

# Signals
func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()
