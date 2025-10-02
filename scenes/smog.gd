extends Area2D
@onready var player = %player
@onready var smogtimer = $smogtimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	body.takedamage(3)
	smogtimer.start()


func _on_smogtimer_timeout():
	player.takedamage(3)
	smogtimer.start()


func _on_body_exited(body):
	smogtimer.stop()
