extends Area2D

@onready var bombanim = $bombanim
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	body.bombcount += 1
	bombanim.play("item_pickup")


func _on_timer_timeout():
	queue_free()
