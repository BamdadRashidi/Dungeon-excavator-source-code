extends CharacterBody2D
@onready var bombplace = $bombplace
@onready var slash = $slash
@onready var lantern = $lantern
@onready var arrowyeet = $arrowyeet
@onready var takerdamage = $takerdamage
@onready var footsteps = $footsteps
var tookcontact = false
@onready var lanternanim = $lanternanim
@onready var i_frames_timer = $"I-frames timer"
@onready var hitflash = $hitflash
@onready var death = $death
@onready var screenflash = $screenflash
var arrowcount = 30
var bombcount = 30
@onready var hitstoptimer = $hitstop
@onready var smear_anim = $"smear anim"
@onready var walking = $walking
@onready var roottransitioncamera = $"../roottransitioncamera"

@onready var deathtimer = $deathtimer
@onready var leverinterraction = $leverinterraction

@onready var hplow = $HPLOW

var keycount = 0

var currentdamagetaken = 0
@onready var hurt_sound = $hurt_sound
@onready var hp_bar = %"Hp bar"
@onready var hit_showcaser = $"CanvasLayer/Hp bar/hit_showcaser"
@onready var show_hit_showcaser = $"CanvasLayer/Hp bar/show_hit_showcaser"
@onready var smear_top = $smearTop
@onready var smearbottom = $smearbottom
@onready var smearright = $smearright
@onready var smearleft = $smearleft
var isdead = false
var keycountUI = 0
var cantakecontactdamage = false
var can_be_knockedback = false
var bombs = preload("res://scenes/bombs.tscn")
var arrow = preload("res://scenes/arrow.tscn")
var health = 40
var cantakedamage = false

@onready var fire_rate = $"fire rate"

@onready var arrow_label = $CanvasLayer/arrow_label
@onready var bomb_label = $CanvasLayer/Bomb_label
@onready var hp_warning = $"CanvasLayer/Hp bar/hp warning"

var speed = 285
var direction = Vector2.ZERO
#shit for sword
@onready var up = $up
@onready var down = $down
@onready var left = $left
@onready var right = $right
@onready var sword = $sword
@onready var swordattackanim = $swordattackanim
@onready var characteranim = $characteranim
@onready var lanternhitbox = $lanternhitbox
@onready var for_hp_low = $"for Hp low"

@onready var player_collider = $"player collider"
@onready var key_label = $CanvasLayer/key_label

@onready var color_rect = $"CanvasLayer/Hp bar/ColorRect"

var islookingright = false
var islookingleft = false
var islookingup = false
var islookingdown = false
var isslashing = false

var can_use_lantern = false
var can_use_bomb = false
var can_use_bow = false


@onready var spawpoint = $"../spawpoint"



var gotbow = false
var gotbombs = false


func _ready():
	player_collider.disabled = false
	sword.monitorable =false
	sword.monitoring = false
	lanternhitbox.monitoring = false
	lanternanim.visible = false
	hp_bar.value = health
	hit_showcaser.value = health
	color_rect.visible = false
	

func _physics_process(delta):
	
	if health <= 10:
		color_rect.visible = true
		for_hp_low.play("low hp")
		hp_warning.play("lowhepe")
	else:
		color_rect.visible = false
		hp_warning.stop()
	key_label.text = str(keycount)
	arrow_label.text = str(arrowcount)
	bomb_label.text = str(bombcount)
	#print(keycount)
	
	if health > 30:
		health = 30
	if bombcount > 30:
		bombcount = 30
	if arrowcount > 30:
		arrowcount = 30

	if can_be_knockedback == true and islookingright == true:
		takeKB(Vector2.LEFT * 5)
	if can_be_knockedback == true and islookingleft == true:
		takeKB(Vector2.RIGHT * 5)
	if can_be_knockedback == true and islookingup == true:
		takeKB(Vector2.DOWN * 5)
	if can_be_knockedback == true and islookingdown == true:
		takeKB(Vector2.UP * 5)

 	#movement
	direction = Input.get_vector("Move_left","Move_right","Move_up","Move_down")
	if direction:
		velocity = direction * speed
		if speed != 0:
			walking.play("walking_sound")
	else:
		velocity = Vector2.ZERO
		footsteps.stop()
		
		

		
		
	#moving the collider for the sword
	if direction.x > 0:
	
		lanternanim.global_position = right.global_position
		lanternhitbox.global_position = right.global_position
		sword.global_position = right.global_position
		characteranim.play("walk_right")
		islookingleft = false
		islookingright = true
		islookingdown = false
		islookingup = false
	if direction.x < 0:
		
		lanternanim.global_position = left.global_position
		sword.global_position = left.global_position
		lanternhitbox.global_position = left.global_position
		characteranim.play("walk_left")
		islookingleft = true
		islookingright = false
		islookingdown = false
		islookingup = false
		
	if direction.y > 0:

		lanternanim.global_position = down.global_position
		sword.global_position = down.global_position
		lanternhitbox.global_position = down.global_position
		characteranim.play("walk_down")
		islookingdown = true
		islookingup = false
		islookingleft = false
		islookingright = false
	if direction.y < 0:

		lanternanim.global_position = up.global_position
		characteranim.play("walk_up")
		sword.global_position = up.global_position
		lanternhitbox.global_position = up.global_position
		islookingdown = false
		islookingup = true
		islookingleft = false
		islookingright = false
	
	

	

	

	move_and_slide()
	
	if health > 0:
	
		if Input.is_action_just_pressed("Slash"):
			isslashing = true
			slash.pitch_scale = randf_range(0.9,1.1)
			slash.play()
			swordattackanim.play("slasher")
			if islookingright == true and isslashing == true:
				characteranim.play("slash_right")
				smear_anim.play("rightsmea")
				await characteranim.animation_finished
				characteranim.play("idle_right")
			if islookingleft == true and isslashing == true:
				characteranim.play("slash_left")
				smear_anim.play("leftsmea")
				await characteranim.animation_finished
				characteranim.play("idle_left")
			if islookingup == true and isslashing == true:
				characteranim.play("slash_up")
				smear_anim.play("upsmea")
				await characteranim.animation_finished
				characteranim.play("idle_up")
			if islookingdown == true and isslashing == true:
				characteranim.play("slash_down")
				smear_anim.play("downsmea")
				await characteranim.animation_finished
				characteranim.play("idle_down")
		else:
			isslashing = false
		
		
		if Input.is_action_just_pressed("use_item"):

			useitem()
			
		#contact damage and i frames
		if cantakecontactdamage:
			
			i_frames_timer.start()
			
	
		
		
		
func takeKB(direction: Vector2):
	var knockbackdirection = direction.direction_to(self.global_position)
	var knockback = direction * 40
	velocity += knockback
	can_be_knockedback = false
	
		
		
		
	
	
func takedamage(damage_value):
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(roottransitioncamera.startSHAKE,1.0,1.0,0.3)
	
	show_hit_showcaser.start()
	health -= damage_value
	currentdamagetaken = damage_value
	hp_bar.value -= damage_value
	hp_bar.damagevalue = hp_bar.value
	
	hitstop()
	hitflash.play("hitflash")
	i_frames_timer.start()
	takerdamage.play()
	#print(health)
	if health <= 0:
		playerdeath()

	
	
		



func _on_takecontactdamage_body_entered(body):
	takedamage(3)
	tookcontact = true
	
	
	
	
	
	
	










func _on_lanternanim_animation_finished():
	lanternanim.visible = false


func _on_iframes_timer_timeout():
	if tookcontact == true:
		takedamage(3)
		i_frames_timer.start()


func _on_takecontactdamage_body_exited(body):
	i_frames_timer.stop()
	tookcontact = false


func hitstop():
	get_tree().paused = true
	hitstoptimer.start()


func _on_hitstop_timeout():
	get_tree().paused = false

func playerdeath():
	speed = 0
	screenflash.play("flashbang")
	get_tree().get_root().set_disable_input(true)
	death.play("death")
	deathtimer.start()
	isdead = true
	


func _on_show_hit_showcaser_timeout():
	hit_showcaser.value -= currentdamagetaken
	if hit_showcaser.value != hp_bar.value:
		show_hit_showcaser.start()


func useitem():
	if can_use_bomb == true:
		if  bombcount > 1:
			bombcount -= 1
			if speed != 0:
				bombplace.play()
			var placedbomb = bombs.instantiate()
			get_tree().root.add_child(placedbomb)
			placedbomb.global_position = self.global_position
		print("bombs?")
	if can_use_bow == true:
		if arrowcount > 0:
			arrowcount -= 1
		
			arrowyeet.play()
			var arrowclone = arrow.instantiate()
			get_tree().root.add_child(arrowclone)
			if islookingdown == true:
				arrowclone.vectorpos = Vector2.DOWN
				arrowclone.global_position = global_position
				arrowclone.verti_arrowsprite.visible = true
				arrowclone.horiz_arrowsprite.visible = false
				arrowclone.verti_arrowsprite.flip_h = false
			if islookingup == true:
				arrowclone.vectorpos = Vector2.UP
				arrowclone.verti_arrowsprite.flip_h = true
				arrowclone.global_position = global_position
				arrowclone.verti_arrowsprite.visible = true
				arrowclone.horiz_arrowsprite.visible = false
			if islookingright == true:
				arrowclone.vectorpos = Vector2.RIGHT
				arrowclone.global_position = global_position
				arrowclone.horiz_arrowsprite.flip_h = false
				arrowclone.verti_arrowsprite.visible = false
				arrowclone.horiz_arrowsprite.visible = true
			if islookingleft == true:
				arrowclone.vectorpos = Vector2.LEFT
				arrowclone.horiz_arrowsprite.flip_h = true
				arrowclone.global_position = global_position
				arrowclone.verti_arrowsprite.visible = false
				arrowclone.horiz_arrowsprite.visible = true
		print("arrows?")
	if can_use_lantern == true:
		swordattackanim.play("lantern")
		if speed != 0:
			lantern.play()
		lanternanim.play()





func _on_deathtimer_timeout():
	get_tree().reload_current_scene()
	isdead = false
