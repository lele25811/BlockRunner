extends Area2D

onready var shapeArea : = $CollisionShape2D as CollisionShape2D
onready var sprite : = $StaticBody2D/Sprite as Sprite

var selected = false
var move = true

func _ready():
	pass # Replace with function body.

func _process(delta):
	if !move:
		shapeArea.disabled = true
		$StaticBody2D/CollisionShape2D.disabled = false
		sprite.modulate = "000000"
	if selected:
		followMouse()
		
func followMouse() -> void:
	position = get_global_mouse_position()

func _on_Blocco_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false
			move = false


func _on_Timer_timeout():
	if move:
		queue_free()
