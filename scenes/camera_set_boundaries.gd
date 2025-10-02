extends Area2D

@onready var camera = $"../player/camera"


@onready var collider = $collider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if camera != null:
		print("womp womp")
		#var colliderx = collider.
		var collidery = collider.scale.y
		#camera.set_dimension(colliderx,collidery)
