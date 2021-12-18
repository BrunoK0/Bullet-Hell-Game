extends Node


func _ready():
	$Player.position = $PlayerStartPos.position
	#$Player.hide()
	
	pass
	
"""
func startGame():
	$Player.position = $PlayerStartPos.position
	$Player.show()
"""



func _on_BossBattle_bossDefeated():
	$FinalMessage.text = "Congratulations!\nYou got hit " + str($Player.player_hit) + " times"
	if($Player.player_hit == 0):
		$FinalMessage.text += "\nPerfect!!"
