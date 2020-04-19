extends "res://Scripts/ActionButton.gd"

onready var main = get_tree().current_scene

func _on_pressed():
	
	var descLabel = Descriptions.Description
	var playerStats = Player
	if playerStats != null:
		if playerStats.mp >= 5:
			if playerStats.hp < playerStats.max_hp:
				playerStats.heal_hp(5)
				playerStats.mp -= 5
				playerStats.ap -= 1
			else: descLabel.text = "Health is full!"
		else: descLabel.text = "Out of Mana..."