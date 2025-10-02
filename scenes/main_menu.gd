extends Control
@onready var play = $main_menu_vbox/Play
@onready var settings_vbox = $settings_Vbox
@onready var main_menu_vbox = $main_menu_vbox
@onready var button = $settings_Vbox/Button
@onready var cave_sample = $"cave sample"
@onready var naviagate = $naviagate
@onready var confirm = $confirm
@onready var htp_label = $"HTP LABEL"
@onready var bacc = $bacc

var gamehasbegun = false
var gameisquit = false

var Master_bus = AudioServer.get_bus_index("Master")
var Music_bus = AudioServer.get_bus_index("Music")
var SFX_bus = AudioServer.get_bus_index("SFX")

func _ready():
	play.grab_focus()
	gamehasbegun = false
	gameisquit = false
	settings_vbox.visible = false
	main_menu_vbox.visible = true
	bacc.visible = false
	htp_label.visible = false

func _process(delta):
	pass



#pushes 
func _on_play_pressed():
	confirm.play()
	gamehasbegun = true

func _on_settings_pressed():
	confirm.play()
	settings_vbox.visible = true
	main_menu_vbox.visible = false
	button.grab_focus()


func _on_quit_pressed():
	confirm.play()
	gameisquit = true
#focus



func _on_play_focus_entered():
	naviagate.play()


func _on_settings_focus_entered():
	naviagate.play()


func _on_quit_focus_entered():
	naviagate.play()


func _on_confirm_finished():
	if gameisquit == true:
		get_tree().quit()
	if gamehasbegun == true:
		get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_pressed():
		confirm.play()
		settings_vbox.visible = false
		main_menu_vbox.visible = true
		play.grab_focus()





func _on_music_value_changed(value):
	cave_sample.play()
	AudioServer.set_bus_volume_db(Music_bus, value)
	if value <= -30:
		AudioServer.set_bus_mute(Music_bus,true)
	else:
		AudioServer.set_bus_mute(Music_bus,false)


func _on_sfx_value_changed(value):
	naviagate.play()
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


func _on_htp_pressed():
	bacc.visible = true
	htp_label.visible = true
	main_menu_vbox.visible = false
	bacc.grab_focus()


func _on_bacc_pressed():
	bacc.visible =false
	htp_label.visible = false
	main_menu_vbox.visible = true
	play.grab_focus()


func _on_htp_focus_entered():
	naviagate.play()





func _on_bacc_focus_entered():
	naviagate.play()
