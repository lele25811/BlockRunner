extends Area2D


var selected = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if selected:
		followMouse()
		
func followMouse() -> void:
	position = get_global_mouse_position()


func _on_BloccoCattivo_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected = true
		else: 
			selected = false
