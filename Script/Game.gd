extends Node2D

onready var player : = $KinematicBody2D as KinematicBody2D
onready var terra : = $Terra as Node2D
onready var punteggio : = $CanvasLayer/HBoxContainer/Label as Label
onready var admob : = $AdMob as AdMob

var block = load("res://Scene/Blocco.tscn")
var badblock = load("res://Scene/BloccoCattivo.tscn")
var number
var rand = RandomNumberGenerator.new()


func _ready():
	# admob.request_consent_info_update()
	global.punti = 0
	admob.load_banner()
	admob.show_banner()
	rand.randomize()
	number = rand.randi_range(0, 7)
	print(number)
	if number >= 6:
		admob.load_interstitial()
	
func _process(delta):
	difficolta()
	if player.position.x > 383:
		aggiornamentoPunteggio()
		
	if player.position.x > 100:
		if player.velocity.x == 0:
			menuFine()
		if player.velocity.y > 2000:
			menuFine()
		
func blockSpawn() -> void:
	rand.randomize()
	var whichBlock = rand.randi_range(0,12)
	var pos_x = rand.randf_range(200,420) + player.position.x
	var pos_y = rand.randf_range(0 ,250) + player.position.y
	if whichBlock <= 1:
		var badblock_instance = badblock.instance()
		badblock_instance.position = Vector2(pos_x, pos_y)
		terra.add_child(badblock_instance)
	else:
		var block_instance = block.instance()
		block_instance.position = Vector2(pos_x, pos_y)
		terra.add_child(block_instance)

func aggiornamentoPunteggio() -> void:
	global.punti = int(player.position.x - 383)
	punteggio.text = str(global.punti)


func _on_Timer_timeout():
	blockSpawn()
	if global.punti > 3000:
		blockSpawn()
	
func difficolta():
	if global.punti > 2000:
		player.speed += 0.05
	if global.punti > 3000:
		player.speed += 0.05
	if global.punti > 5000:
		player.speed += 0.06
	if global.punti > 10000:
		player.speed += 0.05
	
# menu di fine gioco
func menuFine():
	if number >= 5:
		admob.show_interstitial()
	get_tree().change_scene("res://Scene/MenuFine.tscn")

func _on_Area2D_body_entered(body):
	if player.position.x > 100:
		if player.velocity.y == 0:
			if body:
				menuFine()
