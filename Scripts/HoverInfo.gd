extends Control

export (String, MULTILINE) var description = ""
const Descriptions = preload("res://Resources/Descriptions.tres")

func _on_HoverInfo_mouse_entered():
	print(description)
	var descLabel = Descriptions.Description
	if descLabel != null:
		descLabel.text = description


func _on_HoverInfo_mouse_exited():
	print(description)
	var descLabel = Descriptions.Description
	if descLabel != null:
		descLabel.text = ""
