extends Node2D

const Enemy = preload("res://Scenes/Enemy.tscn")

onready var spawn_points = $SpawnPoints

func get_spawn_position():
	var points = spawn_points.get_children()
	points.shuffle()
	
	return points[0].global_position
	
func spawn_enemy():
	var spawn_position = get_spawn_position()
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	var field = main.get_node("Field")
	
	field.add_child(enemy)
	enemy.global_position = spawn_position

# Signals
func _on_Timer_timeout():
	spawn_enemy()
