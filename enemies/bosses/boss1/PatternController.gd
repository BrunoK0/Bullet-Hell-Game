extends Node

signal boss_defeat


# Called when the node enters the scene tree for the first time.
func _ready():
	startPattern1() # Replace with function body.


func startPattern1():
	$AttackPattern1.start()

func startPattern2():
	$AttackPattern2.start()

func _on_AttackPattern1_pattern1_over():
	startPattern2()


func _on_AttackPattern2_pattern2_over():
	emit_signal("boss_defeat")
