extends Control
#Set up shared resources
const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Menu = preload("res://Resources/Menu.tres")
const Player = preload("res://Resources/Player.tres")
#Set up label links
onready var hpLabel = $PlayerStats/StatScores/_HP
onready var apLabel = $PlayerStats/StatScores/_AP
onready var mpLabel = $PlayerStats/StatScores/_MP
onready var strLabel = $PlayerStats/StatScores/_STR
onready var agiLabel = $PlayerStats/StatScores/_AGI
onready var magLabel = $PlayerStats/StatScores/_MAG
onready var intLabel = $PlayerStats/StatScores/_INT
##Set variables to the playerstats resource
onready var max_hp = Player.max_hp
onready var max_ap = Player.max_ap
onready var max_mp = Player.max_mp
onready var _str = Player._str
onready var _agi = Player._agi
onready var _mag = Player._mag
onready var _int = Player._int

func _ready():
	#set labels equal to player stats and call functions to get hp/ap/mp
	Menu.Menu = self
	strLabel.text = str(_str)
	agiLabel.text = str(_agi)
	magLabel.text = str(_mag)
	intLabel.text = str(_int)
	_on_Player_hp_changed()
	_on_Player_ap_changed()
	_on_Player_mp_changed()
	
func _on_Player_hp_changed():
	var current_hp = Player.hp
	if hpLabel != null:
		hpLabel.text = str(current_hp) + "/" + str(max_hp)
	
func _on_Player_ap_changed():
	var current_ap = Player.ap
	if apLabel != null:
		apLabel.text = str(current_ap) + "/" + str(max_ap)

func _on_Player_mp_changed():
	var current_mp = Player.mp
	if mpLabel != null:
		mpLabel.text = str(current_mp) + "/" + str(max_mp)
