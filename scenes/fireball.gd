extends CharacterBody2D
var speed = 5
var direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = 5
	global_position += (direction * speed).rotated(-rotation)


func _on_death_timer_timeout():
	queue_free()
