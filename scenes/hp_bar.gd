extends ProgressBar
var tweenerie = 0
var damagevalue = 0
@onready var hit_showcaser = $hit_showcaser
@onready var show_hit_showcaser = $show_hit_showcaser



func _ready():
	tweenerie = get_tree().create_tween()


func _process(delta):
	
	pass


func _on_show_hit_showcaser_timeout():
	pass # Replace with function body.
