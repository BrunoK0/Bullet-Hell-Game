extends Node2D

enum SPAWNER_MODES {LINEAR, AIMED, FIXED}
enum BULLET_MODES {FIXED}

export var spawner_mode = SPAWNER_MODES.FIXED
var current_spawner_mode = SPAWNER_MODES.FIXED

var bullet_scene = preload("res://bullets/basic/basicBullet.tscn")
onready var shoot_timer = $ShootTimer
onready var spawn_points = $SpawnPoints

export var rotation_speed = 0
export var shoot_timer_wait_time = 0.2
export (int) var spawn_point_number = 4
export var radius = 1

export var arc_angle = 90

func _ready():
	create_spawners()
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()


func _process(delta):
	var new_rotation = rotation_degrees + rotation_speed * delta
	rotation_degrees = fmod(new_rotation, 360)
	if(spawner_mode != current_spawner_mode):
		create_spawners()

func create_spawners():
	if(spawn_point_number < 1):
		spawn_point_number = 1
		
	if(radius <= 0):
		radius = 0.001
	
	for i in range(0, spawn_point_number):
		var spawn_point = Node2D.new()
		var step = float(i) / float(spawn_point_number)
		var pos = Vector2(radius, 0).rotated(arc_angle * step)
		spawn_point.position = pos
		spawn_point.rotation_degrees = pos.angle()
		print_debug(spawn_point)
		spawn_points.add_child(spawn_point)
		
		

func fixed_angle_spawner():
	for i in range(0, spawn_point_number):
		var spawn_point = Node2D.new()
		var step = float(i) / float(spawn_point_number)
		


func shoot_bullets():
	for j in spawn_points.get_children():
		var bullet = bullet_scene.instance()
		get_tree().root.add_child(bullet)
		bullet.position = j.global_position
		bullet.rotation = j.global_rotation
	

func _on_ShootTimer_timeout() -> void:
	#print_debug("shoot bullets")
	shoot_bullets()
