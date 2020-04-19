extends "res://Scripts/ActionButton.gd"

var rng = RandomNumberGenerator.new()
onready var main = get_tree().current_scene


func _ready():
	rng.randomize()

func _on_pressed():
	var enemy = BattleUnits.Enemy
	var playerStats = Player
	var descLabel = Descriptions.Description
	if enemy != null and playerStats != null:
		if playerStats.mp >= 2:
			var attack_roll = rng.randi_range(1,20)
			attack_roll += playerStats._mag
			if (attack_roll >= enemy.dodge):
				var firebolt_random_number = rng.randi_range(1, 10)
				firebolt_random_number += playerStats._mag
				enemy.take_damage(firebolt_random_number)
				descLabel.text = ("Hit! " + str(firebolt_random_number) + " damage!")
				print("Deals" + str(firebolt_random_number) + " damage!")
			else:
				descLabel.text = "Attack missed!"
				print("Attack missed!")
			playerStats.mp -= 2
			playerStats.ap -= 1
		else: descLabel.text = "Out of Mana..."