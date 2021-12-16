extends Node
onready var wave_duration_timer = $WaveDurationTimer

signal wave1_over

var duration_time = 5
var enemy_spawn_delay = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	wave_duration_timer.start(duration_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WaveDurationTimer_timeout():
	emit_signal("wave1_over")
	print("wave1_over")
