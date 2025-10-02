extends StaticBody2D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	animation_player.play("appeart")
	print("deez")

func _on_area_2d_body_exited(body):
	animation_player.play("disappeart")
	print("undeez")
