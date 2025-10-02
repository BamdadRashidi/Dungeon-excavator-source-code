extends CharacterBody2D
@onready var door_1 = $"door 1"
@onready var door_2 = $"door 2"

@onready var system = $system
@onready var on = $on
@onready var off = $off
@onready var on_sound = $"on sound"
@onready var roottransitioncamera = %roottransitioncamera

var ison = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func takedamage(damage_value: float):
	system.play("on")
	print("switch on")
	on.visible = true
	off.visible = false
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(roottransitioncamera.startSHAKE,0.01,1.0,0.1)
func takeknockback():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	on_sound.pitch_scale = randf_range(0.9,1.1)
