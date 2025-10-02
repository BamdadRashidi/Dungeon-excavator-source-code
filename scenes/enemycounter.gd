extends Area2D
@onready var locker_animatoer = $"locker animatoer"

var shutted = false
var enemycounter : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("enemies: ", enemycounter)
	if enemycounter <= 1:
		locker_animatoer.play("open the gates")
		


func _on_body_entered(body):
	enemycounter += 1
	
	


func _on_body_exited(body):
	enemycounter -= 1
	
	
func whatinthefuck():
	enemycounter = 21


func _on_area_2d_body_entered(body):
	locker_animatoer.play("shut the gates")
