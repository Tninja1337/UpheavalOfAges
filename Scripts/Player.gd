extends Resource
class_name Player

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Menu = preload("res://Resources/Menu.tres")

var max_hp = 25
var max_ap = 3
var max_mp = 10

var hp = max_hp setget set_hp
var ap = max_ap setget set_ap
var mp = max_mp setget set_mp
var _str = 1
var _agi = 1
var _mag = 1
var _int = 1

#signal hp_changed(value)
#signal ap_changed(value)
#signal mp_changed(value)
signal end_turn #signal up, use calls when going down

func full_recovery():
	hp = max_hp
	ap = max_ap
	mp = max_mp

func set_hp(value):
	hp = clamp(value, 0, max_hp) #clamp gives a min and max value
	#emit_signal("hp_changed", hp)
	Menu.StatsPanel._on_Player_hp_changed(hp)
	Menu.Menu._on_Player_hp_changed()
	
func heal_hp(value):
	if (hp + value > max_hp): #If this would heal above max, lower value
		value = (max_hp - hp)
		
	hp = hp + value
	Descriptions.Description.text = "Heal for " + str(value) + " HP!"
	Menu.StatsPanel._on_Player_hp_changed(hp)
	Menu.Menu._on_Player_hp_changed()
	print("Heal for " + str(value) + " HP!")
	
func set_ap(value):
	ap = clamp(value, 0, max_ap) 
	Menu.StatsPanel._on_Player_ap_changed(ap)
	Menu.Menu._on_Player_ap_changed()
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(value):
	mp = clamp(value, 0, max_mp)
	Menu.StatsPanel._on_Player_mp_changed(mp)
	Menu.Menu._on_Player_mp_changed()
	
func regain_mp(value):
	if (mp + value > max_mp): #If this would heal above max, lower value
		value = (max_mp - mp)
		
	mp = mp + value
	Descriptions.Description.text = "Regain " + str(value) + " MP!"
	Menu.StatsPanel._on_Player_mp_changed(mp)
	Menu.Menu._on_Player_mp_changed()
	print("Regain " + str(value) + " MP!")
	
func _ready():
	BattleUnits.PlayerStats = self
	
func _exit_tree():
	BattleUnits.PlayerStats = null