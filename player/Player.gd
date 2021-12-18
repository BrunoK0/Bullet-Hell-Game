extends KinematicBody2D

export (int) var speed = 350
export (int) var slowSpeed = 150
var player_hit = 0

onready var fire_delay_timer = $FireDelayTimer
onready var generator = $GeneratorPlayer

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("shift"):
		velocity = velocity.normalized() * slowSpeed
	else:
		velocity = velocity.normalized() * speed
		
	if Input.is_action_pressed("a") and fire_delay_timer.is_stopped():
		generator.shoot()
		fire_delay_timer.start()

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Hurtbox_body_entered(body):
	print(body.name + " hit!")
	player_hit += 1
