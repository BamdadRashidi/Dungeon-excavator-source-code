extends Area2D

@onready var heartanim = $heartanim

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var object

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	object = body
	body.health += 5
	body.hp_bar.value += 5
	heartanim.play("heartpickup")
	





func _on_timer_timeout():
	queue_free()
