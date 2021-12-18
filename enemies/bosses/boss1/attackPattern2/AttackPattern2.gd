extends Node2D

signal start_bullet_pattern
var start_time = 10

signal pattern2_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func start():
	#emit_signal("start_bullet_pattern")
	$PatternStartTimer.start(4)
	pass

func _process(delta):
	if(get_parent().get_parent().health < 1):
		print("pattern2 over")
		emit_signal("pattern2_over")
		queue_free()


func _on_PatternStartTimer_timeout():
	emit_signal("start_bullet_pattern")
	$PatternTimeLimit.start()
	get_parent().get_parent().health = 150


func _on_PatternTimeLimit_timeout():
	get_parent().get_parent().health = 0
