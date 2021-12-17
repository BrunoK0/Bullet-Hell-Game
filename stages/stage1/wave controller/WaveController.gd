extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	startWave1()


func startWave1():
	$Wave1.start()
	
func startWave2():
	$Wave2.start()

func startWave3():
	print("start wave 3")
	
func _on_Wave1_wave1_over():
	startWave2()
	
func _on_Wave2_wave2_over():
	startWave3()
