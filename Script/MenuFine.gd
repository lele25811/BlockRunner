extends Node2D

onready var record : = $CanvasLayer/Record as Label
onready var current : = $CanvasLayer/Current as Label

func _ready():
	global.record = int(Savedata.loader())
	if global.punti > global.record:
		global.record = global.punti
		Savedata.saver(str(global.record))
	record.text = "Record Score : "+str(global.record)
	current.text = "Score : "+str(global.punti)


func _on_Button_pressed() -> void:
	var error_code = get_tree().change_scene("res://Scene/Game.tscn")
	if error_code != OK:
		print("ERROR: ", error_code)
