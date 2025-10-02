extends Area2D

@onready var roottransitioncamera = $"../roottransitioncamera"


@onready var center = $center

var wha = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if roottransitioncamera != null:
		roottransitioncamera.setboundaries(center.global_position)
		"""floor(up.global_position.y),floor(down.global_position.y),floor(left.global_position.y),floor(right.global_position.y),"""
