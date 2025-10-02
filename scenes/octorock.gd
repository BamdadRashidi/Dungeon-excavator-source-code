extends CharacterBody2D
var enemyHP = 4
var chosen = false
var direction = Vector2.ZERO
@onready var octotime = $octotime
@onready var walktime = $walktime


func takedamage(damage_value: float):
	enemyHP -= damage_value
	if enemyHP <= 0:
		queue_free()
	
	
	#knockback is shit
	
func takeknockback(direction: Vector2):
	var knockbackdirection = direction.direction_to(self.global_position)
	var knockback = direction * 40
	velocity += knockback
	move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if chosen == true:
		roll()
	velocity += direction * 0.25
	move_and_slide()
	print(direction)


func _on_octotime_timeout():
		chosen = true
		walktime.start()
			
func roll():
		var random_number  = randf_range(1,4)
		if 0 <= random_number and random_number < 1:
			direction = Vector2.RIGHT
		if 1 <= random_number and random_number < 2:
			direction = Vector2.LEFT
		if 2 <= random_number and random_number < 3:
			direction = Vector2.DOWN
		if 3 <= random_number and random_number < 4:
			direction = Vector2.UP
			chosen = false


func _on_walktime_timeout():
	octotime.start()
	direction = Vector2.ZERO
