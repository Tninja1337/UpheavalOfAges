extends Node2D

#Create different types of cells
enum CELL_TYPES{ ACTOR, OBSTACLE, OBJECT }
export(CELL_TYPES) var type = CELL_TYPES.ACTOR

#Grid variable is set to parent Grid node
onready var Grid = get_parent()
#Create timer for movement speed
onready var time_in_seconds = 0.15

func _process(delta):
	#call get input direction function to determine player key press
	var input_direction = get_input_direction()
	if not input_direction:
		return
	#Find the target position based on direction and use move to function
	#If target location is not viable, do not move to it
	var target_position = Grid.request_move(self, input_direction)
	if target_position:
		move_to(target_position)
	else:
		bump()

func get_input_direction():
	#Create a vector2 based on user key press
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)

func move_to(target_position):
	set_process(false)
	# Move the node to the target cell
	var move_direction = (target_position - position).normalized()
	position = target_position
	#Wait for time before proceeding
	yield(get_tree().create_timer(time_in_seconds), "timeout")
	set_process(true)
	


func bump():
	set_process(false)
	set_process(true)
