extends Node2D

export var speed = 1000


func _process(delta):
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
