extends Path2D

var enemy_amount = 5
var enemy_scene = preload("res://enemies/common/enemyA/PathFollowEnemyA.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemySpawnTimer_timeout():
	if(enemy_amount > 0):
		var enemy = enemy_scene.instance()
		add_child(enemy)
		$EnemySpawnTimer.start()
		enemy_amount += -1
