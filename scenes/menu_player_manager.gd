extends Node
@onready var player = %player
@onready var pause_menu = %"pause Menu"
@onready var bow_sprite = $"../player/CanvasLayer/Hp bar/item_frame/bow_sprite"
@onready var bomb_sprite = $"../player/CanvasLayer/Hp bar/item_frame/Bomb_sprite"
@onready var lantern_sprite = $"../player/CanvasLayer/Hp bar/item_frame/lantern_sprite"

@onready var bow = $"../Menu UI/pause Menu/VBoxContainer2/equipment buttons/bow"
@onready var bomb = $"../Menu UI/pause Menu/VBoxContainer2/equipment buttons/bomb"
@onready var arrow_label = $"../player/CanvasLayer/arrow_label"
@onready var bomb_label = $"../player/CanvasLayer/Bomb_label"
@onready var Bomb = $"../player/CanvasLayer/bomb"
@onready var Arrow = $"../player/CanvasLayer/arrow"
var music = AudioServer.get_bus_index("Music")
@onready var spawpoint = $"../spawpoint"


func _ready():
	pause_menu.visible = false
	
func _process(delta):

	if player.gotbombs == false:
		Bomb.visible = false
		bomb_label.visible = false
	if player.gotbombs == true:
		Bomb.visible = true
		bomb_label.visible = true
	if player.gotbow == false:
		Arrow.visible = false
		arrow_label.visible = false
	if player.gotbow == true:
		Arrow.visible = true
		arrow_label.visible = true
		
	if player.isdead == true:
		get_tree().get_root().set_disable_input(true)
	if player.isdead == false:
		get_tree().get_root().set_disable_input(false)
		
	if Input.is_action_just_pressed("Pause") and get_tree().paused == false:
		pause_menu.visible = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("Pause") and get_tree().paused == true:
		pause_menu.visible = false
		get_tree().paused = false
	

		

		if Input.is_action_just_pressed("Pause"):
			if player.gotbombs == false:
				bomb.visible = false
				bomb.disabled = true
			if player.gotbombs == true:
				bomb.visible = true
				bomb.disabled = false
			if player.gotbow == false:
				bow.visible = false
				bow.disabled = true
			if player.gotbow == true:
				bow.visible = true
				bow.disabled = false
		




	
	if pause_menu.bombequipped == true:
		bomb_sprite.visible = true
		bow_sprite.visible = false
		lantern_sprite.visible = false
		player.can_use_bomb = true
		player.can_use_bow = false
		player.can_use_lantern = false
	if pause_menu.bowequipped == true:
		bomb_sprite.visible = false
		bow_sprite.visible = true
		lantern_sprite.visible = false
		player.can_use_bomb = false
		player.can_use_bow = true
		player.can_use_lantern = false
	if pause_menu.lanternequipped == true:
		bomb_sprite.visible = false
		bow_sprite.visible = false
		lantern_sprite.visible = true
		player.can_use_bomb = false
		player.can_use_bow = false
		player.can_use_lantern = true
	
	
	
	
		
