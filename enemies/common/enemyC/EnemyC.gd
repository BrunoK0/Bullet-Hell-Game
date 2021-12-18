extends KinematicBody2D
var velocity = Vector2()
var health = 50

onready var path = get_parent()
onready var move_delay = $MovemenDelayTimer
onready var move_tween = $MovementTween



# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween.interpolate_property(get_parent(), "unit_offset", 0, 1, 20, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func _process(delta):
	#if $MovemenDelayTimer.is_stopped():
	if(health < 1):
		queue_free()
	
"""
func movement(delta):
	path.offset += 200 * delta
"""

func _on_Hurtbox_body_entered(body):
	health = health - 1
	print(health)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_MovementDelayTimer_timeout():
	print("movement start")
	move_tween.start()
