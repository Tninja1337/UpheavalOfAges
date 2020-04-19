extends Node
#Many thanks to the HeartBeast tutorials on Youtube for helping me learn Godot and set up the Battle System.
#https://www.youtube.com/channel/UCrHQNOyU1q6BFEfkNq2CYMA

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Player = preload("res://Resources/Player.tres")

export(Array, PackedScene) var enemies = []#Packed Scene is tscn

onready var battleActionButtons = $UI/BattleActionButtons #onready makes sure the scene runs first, then the code can access
onready var descLabel = $UI/TextBoxPanel/TextBox
onready var animationPlayer = $AnimationPlayer
onready var nextRoomButton = $UI/CenterContainer/NextRoomButton
onready var enemyStartPosition = $EnemyPosition
#onready var playerStats = BattleUnits.PlayerStats
onready var playerStats = Player
onready var playerMenu = $PlayerMenu

func _ready():
	randomize()
	BattleUnits.BattleManager = self
	BattleUnits.PlayerStats = Player
	start_player_turn()
	var enemy = BattleUnits.Enemy
	if enemy != null:
		enemy.connect("death", self, "_on_Enemy_Death")
	Descriptions.Description = descLabel

func _exit_tree():
	Descriptions.Description = null

func start_player_turn():
	battleActionButtons.show()
	playerStats.ap = playerStats.max_ap
	yield(playerStats, "end_turn")
	start_enemy_turn()
	
func create_new_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var enemy = Enemy.instance()
	enemyStartPosition.add_child(enemy)
	enemy.connect("death", self, "_on_Enemy_Death")
	print("Created enemy")
	
func _on_Enemy_Death():
	nextRoomButton.show()
	battleActionButtons.hide()
	
func start_enemy_turn():
	battleActionButtons.hide()
	var enemy = BattleUnits.Enemy
	if enemy != null and not enemy.is_queued_for_deletion():
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()
	
func _on_NextRoomButton_pressed():
	nextRoomButton.hide()
	animationPlayer.play("ToNextRoom")
	yield(animationPlayer, "animation_finished")
	playerStats.ap = playerStats.max_ap
	battleActionButtons.show()
	create_new_enemy()
	get_tree().change_scene("res://Scenes/WinScreen.tscn")

func _on_MenuButton_pressed():
	var menuLabel = $MenuButton/Label
	if(playerMenu.visible == false):
		playerMenu.show()
		menuLabel.text = "Back"
		
	else:
		playerMenu.hide()
		menuLabel.text = "Menu"
