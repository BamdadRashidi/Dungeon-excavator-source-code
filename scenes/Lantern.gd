extends Area2D







func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_body_entered(body):
	if body.has_method("Lightup"):
		body.Lightup()
	
	
