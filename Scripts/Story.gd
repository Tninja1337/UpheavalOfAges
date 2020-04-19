extends Control

const BattleUnits = preload("res://Resources/BattleUnits.tres")
const Descriptions = preload("res://Resources/Descriptions.tres")
const Menu = preload("res://Resources/Menu.tres")
const StoryStates = preload("res://Resources/StoryStates.tres")

onready var areaLabel = $AreaPanel/AreaLabel
onready var displaySprite = $DisplayPanel/Sprite
onready var textLabel = $TextPanel/TextLabel
onready var optionButtons = $DisplayPanel/ButtonContainer
onready var battleButton = $DisplayPanel/BattleButton
onready var descLabel = $TextBoxPanel/DescriptionLabel
onready var hoverA = $DisplayPanel/ButtonContainer/AButton/HoverInfo
onready var hoverB = $DisplayPanel/ButtonContainer/BButton/HoverInfo
onready var hoverC = $DisplayPanel/ButtonContainer/CButton/HoverInfo

func _ready():
	StoryStates._load_options()	
	StoryStates._ready()
	textLabel.text = StoryStates.currentStory
	Descriptions.Description = descLabel

func _progress_story():
	textLabel.text = StoryStates.currentStory
	var stateTracker = StoryStates.stateTracker
	if(stateTracker == 1):
		_hide_options()
		_to_Battle()
	
func _hide_options():
	optionButtons.hide()
	
func _to_Battle():
	battleButton.show()

#Button Options
func _on_AButton_pressed():
	if(StoryStates.currentA == StoryStates.introA):
		StoryStates.introA_selected()
	_progress_story()

func _on_AButton_mouse_entered():
	hoverA.description = StoryStates.currentA
	hoverA._on_HoverInfo_mouse_entered()
	print(hoverA.description)

func _on_BButton_pressed():
	if(StoryStates.currentB == StoryStates.introB):
		StoryStates.introB_selected()
	_progress_story()

func _on_BButton_mouse_entered():
	hoverB.description = StoryStates.introB
	hoverB._on_HoverInfo_mouse_entered()
	print(hoverB.description)

func _on_CButton_pressed():
	if(StoryStates.currentC == StoryStates.introC):
		StoryStates.introC_selected()
	_progress_story()

func _on_CButton_mouse_entered():
	hoverC.description = StoryStates.introC
	hoverC._on_HoverInfo_mouse_entered()
	print(hoverC.description)

func _on_BattleButton_pressed():
	get_tree().change_scene("res://Scenes/Battle.tscn")
