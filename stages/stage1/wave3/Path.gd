extends Path2D

var enemy_amount = 1
var enemy_scene = preload("res://enemies/common/enemyC/PathFollowEnemyC.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_EnemySpawnTimer_timeout():
	print("path2")
	if(enemy_amount > 0):
		var enemy = enemy_scene.instance()
		add_child(enemy)
		$EnemySpawnTimer.start()
		enemy_amount += -1
