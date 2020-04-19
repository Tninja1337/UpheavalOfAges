extends Node2D

onready var nav_2D : Navigation2D = $Navigation2D
onready var line_2D : Line2D = $Line2D
onready var character : Sprite = $Character

#Listen to players input. 
#We only want the player to move if the 
#input is not interrupted by the interface.
func _unhandled_input(event: InputEvent) -> void:
	
	#Only run if it's a click down.
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return 
		
	#Get player position and mouse click position
	var new_path : = nav_2D.get_simple_path(character.global_position, event.global_position)
	#Set new path
	line_2D.points = new_path
	character.path = new_path