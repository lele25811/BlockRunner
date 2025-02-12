extends Node

var save_file = "user://save_file.save"
var g_data = {}
var highscore

func _ready():
	loader()

func saver(datatosave):
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_string(datatosave)
	file.close()
	
func loader():
	var file = File.new()
	file.open(save_file, File.READ)
	var textHighscore = file.get_as_text()
	file.close()
	
	return textHighscore
