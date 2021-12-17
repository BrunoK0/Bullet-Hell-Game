extends Node
onready var wave_duration_timer = $WaveDurationTimer

signal wave1_over

var duration_time = 3
var enemy_spawn_delay = 0.2

func start():
	wave_duration_timer.start(duration_time)
	$PathLeft/EnemySpawnTimer.start(enemy_spawn_delay)
	$PathRight/EnemySpawnTimer.start(enemy_spawn_delay)

func _on_WaveDurationTimer_timeout():
	emit_signal("wave1_over")
	print("wave1_over")
