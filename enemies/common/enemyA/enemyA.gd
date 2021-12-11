extends Node

var health = 15


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	if(health < 1):
		queue_free()
	


func _on_Hurtbox_body_entered(body):
	health = health - 1
	print(health)

