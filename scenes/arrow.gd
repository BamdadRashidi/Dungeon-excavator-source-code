extends Node2D

var vectorpos = Vector2.ZERO
var speed = 8.5
@onready var horiz_arrowsprite = $horiz_arrowsprite
@onready var verti_arrowsprite = $verti_arrowsprite
@onready var bowhitbox = $bowhitbox
@onready var arrowouch = $arrowouch
var farticles = preload("res://scenes/deathparticle.tscn")

@onready var arrowplayer = $arrowplayer




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self != null and bowhitbox != null:
		bowhitbox.monitoring = true
		position += (vectorpos * speed).rotated(rotation)
	
	


func _on_timer_timeout():
	arrowouch.play()
	queue_free()

func summonparticle():
	bowhitbox.monitorable = false
	bowhitbox.monitoring = false
	var newpartc = farticles.instantiate()
	get_tree().root.add_child(newpartc)
	newpartc.scale.y = 0.15
	newpartc.scale.x = 0.15
	newpartc.global_position = self.global_position
