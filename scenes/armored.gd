extends CharacterBody2D
@onready var fatfuckplayer = $fatfuckplayer
@onready var sight = $sight

@onready var camera = %roottransitioncamera
var isseen = false
@onready var knight_grunt = $"knight grunt"
@onready var knightded = $knightded
@onready var fatfucksprite = $fatfucksprite
@onready var angry_pumpkin = $"angry pumpkin"

var partcile = preload("res://scenes/deathparticle.tscn")
@onready var attacktimer = $attacktimer

var enemyHP = 20
@onready var player = %player



var Hp_item = preload("res://scenes/heart_item.tscn")
var arrow_item = preload("res://scenes/arrow_item.tscn")
var bomb_item = preload("res://scenes/bomb_item.tscn")
var rngjesus = RandomNumberGenerator.new()


func takedamage(damage_value: float):
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(camera.startSHAKE,0.5,1.0,0.2)
	enemyHP -= damage_value
	if enemyHP <= 0:
		dropitem()
		fatfuckplayer.play("fatfuck_died_of_high_calories")
	
	
	#knockback is shit
	
func takeknockback(direction: Vector2):
	var knockbackdirection = direction.direction_to(self.global_position)
	var knockback = direction * 40
	velocity += knockback
	move_and_slide()

func _ready():
	fatfucksprite.play("idle")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isseen == true:
		knight_grunt.play()
		player.takedamage(17)
		isseen = false
		attacktimer.start()
		fatfucksprite.play("SPEEN")

	
		










func _on_attacktimer_timeout():
	isseen = true
	


func _on_sight_body_entered(body):
	isseen = true


func _on_sight_body_exited(body):
	isseen = false
	attacktimer.stop()


func _on_threatening_area_body_entered(body):
	fatfucksprite.play("angy")
	angry_pumpkin.play()


func _on_threatening_area_body_exited(body):
	fatfucksprite.play("idle")
	
func summonparticle():
	sight.monitorable = false
	sight.monitoring = false
	fatfucksprite.visible = false
	var newpart = partcile.instantiate()
	get_tree().root.add_child(newpart)
	newpart.scale.y = 2
	newpart.scale.x = 2
	newpart.global_position = self.global_position


func dropitem():
	rngjesus.randomize()

	var generalrando = rngjesus.randi_range(1,40)
	print(generalrando)
	if generalrando >= 1 and generalrando <= 10 and player.gotbow:
		var arrowclone = arrow_item.instantiate()
		get_tree().root.add_child(arrowclone)
		arrowclone.global_position = self.global_position
		print("arrow")
	if generalrando >= 11 and generalrando <= 20:
		print("nothing")
		pass
	if generalrando >= 21 and generalrando <= 30:
		var heartclone = Hp_item.instantiate()
		get_tree().root.add_child(heartclone)
		heartclone.global_position = self.global_position
		print("heart")
	if generalrando >= 31 and generalrando <= 40 and player.gotbombs:
		var bombclone = bomb_item.instantiate()
		get_tree().root.add_child(bombclone)
		bombclone.global_position = self.global_position
		print("bombs")
		
		
	
