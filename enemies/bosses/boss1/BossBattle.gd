extends Node

var boss_scene = preload("res://enemies/bosses/boss1/Boss1.tscn")
signal bossDefeated

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start():
	var boss = boss_scene.instance()
	add_child(boss)
	boss.start()

func bossDefeated():
	emit_signal("bossDefeated")
