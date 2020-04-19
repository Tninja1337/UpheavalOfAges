extends Panel

const Menu = preload("res://Resources/Menu.tres")

onready var hpLabel = $StatsContainer/HP
onready var apLabel = $StatsContainer/AP
onready var mpLabel = $StatsContainer/MP

func _ready():
	Menu.StatsPanel = self

func _on_Player_hp_changed(value):
	hpLabel.text = "HP\n" + str(value)

func _on_Player_ap_changed(value):
	apLabel.text = "AP\n" + str(value)

func _on_Player_mp_changed(value):
	mpLabel.text = "MP\n" + str(value)
