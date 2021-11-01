extends Node2D

export (float) var speed = 200;
export (float) var lifetime = 10.00;
export (Vector2) var velocity = Vector2();
export (bool) var use_velocity; # If true use velocity, if false use rotation
export (float) var rotation_change;


func _process(delta):
	if use_velocity:
		position += velocity.normalized() * speed * delta;
	else:
		position += Vector2(cos(rotation), -sin(rotation)) * speed * delta;
	
	rotation_degrees += rotation_change * delta;
