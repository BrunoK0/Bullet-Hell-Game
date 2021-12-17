extends Node2D

var bullet_scene = preload("res://bullets/basic/basicBullet.tscn")
onready var shoot_timer = $ShootTimer
onready var rotator = $Rotator

export var rotation_speed = 0
export var shoot_timer_wait_time = 3
export var spawn_point_number = 9
export var arch_angle = 70
export var angle_offset = 90
export var radius = 1
export (bool) var follow_player = false
export var follow_player_speed = 1
export var bullet_speed = 50

export (bool) var stack = true
export var bullet_speed_min = 100
export var bullet_speed_max = 175
export var stack_bullet_number = 2


func _ready():	
	create_spawners()


func create_spawners():
	if(spawn_point_number < 1):
		spawn_point_number = 1
		
	if(radius <= 0):
		radius = 0.001
		
	rotator.rotate(deg2rad(angle_offset))	
		
	if(spawn_point_number == 1):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
		print_debug('spawn point created')
		shoot_timer.wait_time = shoot_timer_wait_time
		shoot_timer.start()
		return
	
	var step
	if(arch_angle >= 360):
		step = deg2rad(360) / (spawn_point_number)
	else:
		step = deg2rad(arch_angle) / (spawn_point_number - 1)
		
	for i in range(0, spawn_point_number):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i - deg2rad(arch_angle / 2))
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
		print_debug('spawn point created')
		
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()
	

func _process(delta):
	if(follow_player):
		rotator.look_at(get_tree().get_root().get_node("Main/Player").global_position)
	else:
		var new_rotation = rotator.rotation_degrees + rotation_speed * delta
		rotator.rotation_degrees = fmod(new_rotation, 360)
	

func _on_ShootTimer_timeout() -> void:
	if(stack):
		var speed_interval = (bullet_speed_max - bullet_speed_min) / stack_bullet_number
		
		for s in rotator.get_children():
			for j in stack_bullet_number:
				var bullet = bullet_scene.instance()
				get_tree().root.add_child(bullet)
				bullet.position = s.global_position
				bullet.rotation = s.global_rotation
				bullet.speed = bullet_speed_min + j * speed_interval
	else:
		for s in rotator.get_children():
			var bullet = bullet_scene.instance()
			get_tree().root.add_child(bullet)
			bullet.position = s.global_position
			bullet.rotation = s.global_rotation
			bullet.speed = bullet_speed
