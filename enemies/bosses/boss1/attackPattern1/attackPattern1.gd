extends Node2D

signal start_bullet_pattern
var start_time = 10

signal pattern1_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start():
	$PatternStartTimer.start(6)


func _process(delta):
	if(get_parent().get_parent().health < 1):
		print("pattern1 over")
		emit_signal("pattern1_over")
		get_parent().get_parent().health = 150
		queue_free()

func _on_PatternStartTimer_timeout():
	emit_signal("start_bullet_pattern")
	$PatternTimeLimit.start()
	get_parent().get_parent().health = 150


func _on_PatternTimeLimit_timeout():
	get_parent().get_parent().health = 0
