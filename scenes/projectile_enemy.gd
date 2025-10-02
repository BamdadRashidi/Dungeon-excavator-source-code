extends CharacterBody2D
@onready var wizard_anim = $wizard_anim
@onready var aimray = $aimray
var isseen = false
var aim = null
@onready var wait_to_shoot = $wait_to_shoot
@onready var shot = $shot
var fireball = preload("res://scenes/fireball.tscn")
var fireclone = null
var projectile_speed = 100
var enemyHP = 25
@onready var player = %player
@onready var wait_for_tp_to_done = $wait_for_TP_To_DONE
@onready var wait_before_tp = $wait_before_tp
@onready var huzzah = $HUZZAH
@onready var ded_lol = $"ded lol"
@onready var collision_shape_2d = $CollisionShape2D
@onready var fire_anim = $fire_anim
@onready var fgucking_die = $"FGUCKING DIE"
@onready var camera = %roottransitioncamera
var particle = preload("res://scenes/deathparticle.tscn")

@onready var hitflash = $hitflash

var Hp_item = preload("res://scenes/heart_item.tscn")
var arrow_item = preload("res://scenes/arrow_item.tscn")
var bomb_item = preload("res://scenes/bomb_item.tscn")
var rngjesus = RandomNumberGenerator.new()






#for TP
var TPX = 0
var TPY = 0

@onready var wait_for_tp = $wait_for_TP

@onready var after_teleport = $after_teleport
@onready var during_teleport = $during_teleport
@onready var tanim = $TANIM
@onready var damage = $damage

var gonnaTP = false

func _ready():
	fire_anim.visible = false

func takedamage(damage_value: float):
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(camera.startSHAKE,0.2,1.0,0.2)
	enemyHP -= damage_value
	damage.play()
	hitflash.play("wizhitflash")
	if enemyHP <= 0:
		fgucking_die.play("DIE")
	
	
	#knockback is shit
	
func takeknockback():
	if player.islookingup:
		velocity += Vector2.UP * 2500
	if player.islookingdown:
		velocity += Vector2.DOWN * 2500
	if player.islookingleft:
		velocity += Vector2.LEFT * 2500
	if player.islookingright:
		velocity += Vector2.RIGHT * 2500
	move_and_slide()
func _process(delta):
	


	
	
	

	
	aimray.target_position = to_local(player.global_position)
	if aimray.target_position.x < 0:
		wizard_anim.flip_h = false
	else:
		wizard_anim.flip_h = true
	
	if fireclone != null:
		aim = player.global_position
		if aim != null:
			fireclone.direction = self.global_position.direction_to(aim)



func _on_wait_to_shoot_timeout():
	
	#if gonnaTP == false:
	fire_anim.visible = true
	fire_anim.play("FIRE IN THE HOOOOOOLE")
	wizard_anim.play("wizard_angy")
	fireclone = fireball.instantiate()
	get_tree().root.add_child(fireclone)
	fireclone.global_position = self.global_position
	huzzah.pitch_scale = randf_range(0.9,1.1)
	huzzah.play()
	#print("FIRE IN THE HOLE")
	shot.start()



func _on_shot_timeout():
	wizard_anim.play("wizard_chill")
	wait_to_shoot.start()
	#print("WATER ON THE HILL")



	
	
	
	
	
	#teleportaion





func _on_wait_for_tp_timeout():
	wizard_anim.visible = true
	during_teleport.start()
	gonnaTP = true


func _on_during_teleport_timeout():
	#coordinates to teleport
	TPX = randi_range(-35,45)
	TPY = randi_range(-35,45)
	var shouldthey = randi_range(0,3)
	if shouldthey == 0:
		self.global_position.x += TPX
		self.global_position.y += TPY
	if shouldthey == 1:
		self.global_position.x -= TPX
		self.global_position.y -= TPY
	if shouldthey == 2:
		self.global_position.x -= TPX
		self.global_position.y += TPY
	if shouldthey == 3:
		self.global_position.x += TPX
		self.global_position.y -= TPY
	after_teleport.start()
	wait_for_tp_to_done.start()
	print(shouldthey)
	
	


func _on_after_teleport_timeout():
	gonnaTP = false
	wizard_anim.visible = true
	wait_for_tp.wait_time = randi_range(9,15)
	wait_before_tp.wait_time = wait_for_tp.wait_time - 1
	wait_for_tp.start()
	wait_before_tp.start()
	


func _on_wait_before_tp_timeout():
	tanim.play("teleport")
	


func _on_wait_for_tp_to_done_timeout():
	tanim.play("anti_teleport")


func ded():
	wizard_anim.visible = false
	ded_lol.play()
	collision_shape_2d.disabled = true
	dropitem()
	

func summonparticle():
	var newpart = particle.instantiate()
	get_tree().root.add_child(newpart)
	newpart.global_position = self.global_position
	if wizard_anim.flip_h == true:
		newpart.scale.x = -1
	else:
		newpart.scale.x = 1
	


func _on_fire_anim_animation_finished():
	fire_anim.hide()
	
	
	
	
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
		
		
	


func _on_sight_body_entered(body):
	wait_to_shoot.start()
