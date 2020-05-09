extends Area2D

export(int) var SPEED = 20;
export(int) var HEALTH = 3;

func _ready():
	pass

func _process(delta):
	position.x -= SPEED * delta;
