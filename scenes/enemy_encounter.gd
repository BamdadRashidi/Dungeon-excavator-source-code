extends Area2D

var entitycounter : int = 0
@onready var door = $door
@onready var door_2 = $door2



func _ready():
	pass



func _process(delta):
	entitycounter = get_child_count()
		
	if entitycounter <= 0:
		door.hide()
		door_2.hide()
		



func _on_body_entered(body):
	if body.collision_layer == 8:
		door.show()
		door_2.show
