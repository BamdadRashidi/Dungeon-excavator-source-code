extends CharacterBody2D
var target = Vector2.ZERO
@onready var wait_for_shoot = $wait_for_shoot
var fireball = preload("res://scenes/fireball.tscn")
@onready var player = %player
@onready var statue_ray = $statue_ray
var canshoot = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	statue_ray.target_position = to_local(player.global_position)
	target = statue_ray.target_position
	if canshoot == true:
		shootfire()
		


func _on_wait_for_shoot_timeout():
	canshoot = true
	

func shootfire():
	var projectile = fireball.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = self.global_position
	var angle = target.angle_to(player.global_position)
	print(angle)
	#projectile.rotation = angle (this was the first code that worked but needs tweaking to track the player properly)
	projectile.rotation = tan(angle) / sin(angle)
	canshoot = false
	wait_for_shoot.start()
