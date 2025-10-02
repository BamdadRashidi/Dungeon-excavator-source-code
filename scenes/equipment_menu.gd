extends Control

@onready var info_label = %"info label"


@onready var sword = $HBoxContainer/sword
@onready var navigation = $navigation
@onready var selection = $selection


# Called when the node enters the scene tree for the first time.
func _ready():
	sword.grab_focus()
	navigation.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sword_focus_entered():
	navigation.play()
	info_label.text = "slash your enemies with your trusty weapon"
	

		


func _on_lantern_focus_entered():
	navigation.play()
	info_label.text = "light up your path and anything flammable"
	
	
		

func _on_bow_focus_entered():
	navigation.play()
	info_label.text = "shoot anything from a safer distance"
	


	

func _on_bombs_focus_entered():
	navigation.play()
	info_label.text = "blow up anything"
	

		
