extends Node2D

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Player = preload("res://Resources/Player.tres")
const Menu = preload("res://Resources/Menu.tres")

export (int) var hp setget set_hp 
export (int) var damage
export (int) var dodge

onready var hpLabel = $HPLabel #onready makes sure the scene runs first, then the code can access
onready var animPlayer = $AnimationPlayer

signal death
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp) + " HP"
	
func _ready():
	BattleUnits.Enemy = self
	
func _exit_tree():
	BattleUnits.Enemy = null
		
func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animPlayer.play("Attack")
	yield(animPlayer, "animation_finished")
	emit_signal("end_turn")
	
func deal_damage():
	Player.hp -= damage
	print("Deal damage.")
	if Player.hp <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn") 
	
func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("death")
		queue_free()
	else:
		animPlayer.play("Shake")
		yield(animPlayer, "animation_finished")
	
func is_dead():
	return hp <= 0