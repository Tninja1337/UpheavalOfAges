extends "res://Scripts/ActionButton.gd"

var rng = RandomNumberGenerator.new()
onready var main = get_tree().current_scene
const Slash = preload("res://Scenes/Animations/Slash.tscn") #preload Slash animation scene

func _ready():
	rng.randomize()

func _on_pressed():
	var enemy = BattleUnits.Enemy
	var playerStats = Player
	var descLabel = Descriptions.Description
	if enemy != null and playerStats != null:
		create_slash(enemy.global_position)
		var attack_roll = rng.randi_range(1,20)
		attack_roll += playerStats._str
		if (attack_roll >= enemy.dodge):
			var sword_random_number = rng.randi_range(1, 8)
			sword_random_number += playerStats._str
			enemy.take_damage(sword_random_number)
			descLabel.text = ("Hit! " + str(sword_random_number) + " damage!")
			print("Deals " + str(sword_random_number) + " damage!")
		else:
			descLabel.text = "Attack missed!"
			print("Attack missed!")
	playerStats.ap -= 1
	
#Create slash animation
func create_slash(position):
	var slash = Slash.instance()
	main.add_child(slash)
	slash.global_position = position
		