extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = $PlayerStartPos.position
	#$Generator.position = $GeneratorPos.position
	$EnemyA.position = $Position2D.position
	$EnemyA2.position = $Position2D2.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
