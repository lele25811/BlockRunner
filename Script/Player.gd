extends KinematicBody2D

var number = 0
var rand = RandomNumberGenerator.new()

const FLOOR_NORMAL : = Vector2(0, -1)
var gravity : = 10
var speed : = 100.0
var velocity : = Vector2()
var target_speed : = 0

func _physics_process(delta) -> void:
	velocity.y = velocity.y + gravity
	velocity.x = speed
	var snap : = Vector2.DOWN * 8 
	velocity = move_and_slide_with_snap(velocity, FLOOR_NORMAL)

func _on_Timer_timeout():
	rand.randomize()
	number = int(rand.randf_range(0, 5))
