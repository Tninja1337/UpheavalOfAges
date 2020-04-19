extends "res://Scripts/ActionButton.gd"

onready var main = get_tree().current_scene

func _on_pressed():
	
	var descLabel = Descriptions.Description
	var playerStats = BattleUnits.PlayerStats
	if playerStats != null:
		if playerStats.mp < playerStats.max_mp:
			playerStats.regain_mp(playerStats._mag + 1)
			playerStats.ap -= 1
		else: descLabel.text = "Mana is full!"