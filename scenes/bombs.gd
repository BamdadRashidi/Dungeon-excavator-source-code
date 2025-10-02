extends Area2D
@onready var bombtimer = $bombtimer
@onready var explosion_sound = $"explosion sound"
@onready var boomanim = $boomanim
@onready var beforeboom = $beforeboom
var timetoplay = false
@onready var animation_player = $AnimationPlayer
@onready var explo = $explo

var roottransitioncamera = 0





# Called when the node enters the scene tree for the first time.
func _ready():
	beforeboom.start()
	bombtimer.start()
	monitorable = false
	monitoring = false
	explo.visible = false
	roottransitioncamera = get_node("../world/roottransitioncamera")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timetoplay == true:
		boomanim.play("HELLO DONETSK CHILDREN  IT'S 5 BILLION ROCKETS BOOM!!!!")
	else:
		boomanim.play("default")


func _on_bombtimer_timeout():
	boomanim.visible = false
	explosion_sound.play()
	monitorable = true
	monitoring = true
	print("kaboom")

	
	explo.play()
	animation_player.play("Hello donetsk children it's 5 billion rockets boom!")


func _on_body_entered(body):
	if body.has_method("takedamage"):
		body.takedamage(20)


func _on_beforeboom_timeout():
	timetoplay = true
	
func shake():
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(roottransitioncamera.startSHAKE,20.0,1.0,1.0)
