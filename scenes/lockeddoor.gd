extends StaticBody2D
@onready var player = %player
var canbeinterracted = false
@onready var animator = $animator

@onready var collision_shape_2d = $interractable_space/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	canbeinterracted = false
	collision_shape_2d.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interractable_space_body_entered(body):
	canbeinterracted = true
	if canbeinterracted == true and player.keycount > 0:
		player.keycount -= 1
		animator.play("unlock_sesame")

func _on_interractable_space_body_exited(body):
	canbeinterracted = false
