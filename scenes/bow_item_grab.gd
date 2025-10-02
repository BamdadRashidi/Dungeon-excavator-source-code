extends Area2D
@onready var item_anim = $item_anim

@onready var player = %player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	item_anim.play("bow_thing")


func applybool():
	player.gotbow = true
