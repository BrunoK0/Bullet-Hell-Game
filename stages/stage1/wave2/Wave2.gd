extends Node
onready var wave_duration_timer = $WaveDurationTimer

signal wave2_over

var duration_time = 16
var enemy_spawn_delay = 1

func start():
	wave_duration_timer.start(duration_time)
	$Path/EnemySpawnTimer.start(enemy_spawn_delay)

func _on_WaveDurationTimer_timeout():
	emit_signal("wave2_over")
	print("wave2_over")

