extends KinematicBody2D
var velocity = Vector2()
var health = 150

onready var move_tween = $MovementTween

func _ready():
	pass

func start():
		move_tween.interpolate_property(self, "position", Vector2(512, -20), Vector2(512, 140), 6, Tween.TRANS_QUINT, Tween.EASE_IN_OUT)
		print("movement start")
		move_tween.start()

func _process(delta):
	pass
	
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
	#move_tween.start()


func _on_PatternController_boss_defeat():
	print("boss defeated!")
	get_parent().bossDefeated()
	queue_free()
