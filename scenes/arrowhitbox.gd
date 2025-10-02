extends Area2D


@onready var verti_arrowsprite = $"../verti_arrowsprite"
@onready var horiz_arrowsprite = $"../horiz_arrowsprite"
@onready var arrowplayer = $"../arrowplayer"



	
	

func _on_body_entered(body):
	if body.collision_layer == 6:
		arrowplayer.play("arrowdednotbigsurpirse")
		verti_arrowsprite.visible = false
		horiz_arrowsprite.visible = false
	else:
		body.takedamage(5)
		body.takeknockback()
		verti_arrowsprite.visible = false
		horiz_arrowsprite.visible = false
		arrowplayer.play("arrowdednotbigsurpirse")
