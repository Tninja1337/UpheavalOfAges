extends Node2D

class_name TurnQueue

var active_character

func initialize():
	active_character = get_child(0) #Get child of TurnQueue
	
func play_turn():
	yield(active_character.play_turn(), "completed") #Wait until the function finishes for the active character
	var new_index : int = (active_character.get_index() + 1) % get_child_count() #Get next child
	active_character = get_child(new_index) #Set active character