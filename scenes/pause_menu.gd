extends Control

@onready var continuebutton = %continue
@onready var save = $VBoxContainer/save
@onready var settings = $VBoxContainer/settings
@onready var quit = $VBoxContainer/quit
@onready var select = $select
@onready var player = %player

@onready var bow = $"VBoxContainer2/equipment buttons/bow"
@onready var bomb = $"VBoxContainer2/equipment buttons/bomb"

@onready var navigation = $navigation

@onready var audio_container = $audio_container
@onready var v_box_container_2 = $VBoxContainer2

var Master_bus = AudioServer.get_bus_index("Master")
var Music_bus = AudioServer.get_bus_index("Music")
var SFX_bus = AudioServer.get_bus_index("SFX")

@onready var button = $audio_container/Button

var lanternequipped = false
var bombequipped = false
var bowequipped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	bow.disabled = true
	bomb.disabled = true
	bow.visible = false
	bomb.visible = false
	continuebutton.grab_focus()
	navigation.stop()
	v_box_container_2.visible = true
	audio_container.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		continuebutton.grab_focus()


func _on_save_focus_entered():
	navigation.play()


func _on_settings_focus_entered():
	navigation.play()


func _on_quit_focus_entered():
	navigation.play()



func _on_continue_pressed():
	select.play()
	if get_tree().paused == true:
		get_tree().paused = false
		visible = false

func _on_save_pressed():
	select.play()


func _on_settings_pressed():
	select.play()
	v_box_container_2.visible = false
	audio_container.visible = true
	button.grab_focus()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_continue_focus_entered():
	navigation.play()


func _on_continue_mouse_entered():
	navigation.play()


func _on_save_mouse_entered():
	navigation.play()


func _on_settings_mouse_entered():
	navigation.play()


func _on_quit_mouse_entered():
	navigation.play()


func _on_lantern_focus_entered():
	navigation.play()


func _on_bow_focus_entered():
	navigation.play()


func _on_bomb_focus_entered():
	navigation.play()


func _on_lantern_pressed():
	lanternequipped = true
	bombequipped = false
	bowequipped = false


func _on_bow_pressed():
	lanternequipped = false
	bombequipped = false
	bowequipped = true


func _on_bomb_pressed():
	lanternequipped = false
	bombequipped = true
	bowequipped = false


func _on_music_value_changed(value):

	AudioServer.set_bus_volume_db(Music_bus, value)
	if value <= -30:
		AudioServer.set_bus_mute(Music_bus,true)
	else:
		AudioServer.set_bus_mute(Music_bus,false)


func _on_sfx_value_changed(value):
	navigation.play()
	AudioServer.set_bus_volume_db(SFX_bus, value)
	if value <= -30:
		AudioServer.set_bus_mute(SFX_bus,true)
	else:
		AudioServer.set_bus_mute(SFX_bus,false)


func _on_master_value_changed(value):
	AudioServer.set_bus_volume_db(Master_bus, value)
	if value <= -30:
		AudioServer.set_bus_mute(Master_bus,true)
	else:
		AudioServer.set_bus_mute(Master_bus,false)


func _on_button_pressed():
	v_box_container_2.visible = true
	audio_container.visible = false
	continuebutton.grab_focus()
