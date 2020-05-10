extends Area2D

export(int) var SPEED = 20;
export(int) var HEALTH = 3;

func _ready():
	pass

func _process(delta):
	position.x -= SPEED * delta;

func _on_Enemy_body_entered(body):
	body.queue_free()
	
	HEALTH -= 1
	if HEALTH <= 0:
		queue_free()
