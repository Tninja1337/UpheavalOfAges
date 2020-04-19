extends Control

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Player = preload("res://Resources/Player.tres")

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Story.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	Player.full_recovery()
