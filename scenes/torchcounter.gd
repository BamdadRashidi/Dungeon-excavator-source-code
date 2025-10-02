extends Area2D
@onready var static_body_2d = $door/StaticBody2D
@onready var sprite_2d = $door/Sprite2D

var torchcount : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	static_body_2d.disabled = false
	sprite_2d.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("torches lit: ", torchcount)
	if torchcount >= 6:
		static_body_2d.disabled = true
		sprite_2d.visible = false


func _on_body_entered(body):

	if body.islit == true:
		torchcount += 1
	


func _on_body_exited(body):
	torchcount -= 1
