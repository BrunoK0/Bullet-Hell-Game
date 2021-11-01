extends Node2D

var bullet_scene = preload("res://bullets/basic/basicBullet.tscn")
onready var shoot_timer = $ShootTimer
onready var rotater = $Rotator

export var rotation_speed = 0
export var shoot_timer_wait_time = 0.2
export var spawn_point_number = 4
export var arch_angle = 180
export var radius = 1
export (bool) var follow_player = false

func _ready():	
	var step = deg2rad(arch_angle) / spawn_point_number
	
	for i in range(spawn_point_number + 1):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()


func _process(delta):
	var new_rotation = rotater.rotation_degrees + rotation_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
	

func _on_ShootTimer_timeout() -> void:
	for s in rotater.get_children():
		var bullet = bullet_scene.instance()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation	
