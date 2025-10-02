extends CharacterBody2D
@onready var batanim = $batanim
@onready var batsound = $batsound
@onready var enemycollider = $enemycollider
@onready var camera = %roottransitioncamera
var particles = preload("res://scenes/deathparticle.tscn")
@onready var batanim_2 = $batanim2
@onready var batdamdam = $batdamdam
@onready var flapsound = $flapsound
@onready var batshit = $batshit
@onready var batflash = $batflash


var speed = 245
@onready var sight = $sight

var enemyHP = 6
@onready var player = %player
var spotted = false


var Hp_item = preload("res://scenes/heart_item.tscn")
var arrow_item = preload("res://scenes/arrow_item.tscn")
var bomb_item = preload("res://scenes/bomb_item.tscn")
var rngjesus = RandomNumberGenerator.new()


func _ready():
	sight.monitoring = true

func takedamage(damage_value: float):
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(camera.startSHAKE,0.2,1.0,0.2)
	if spotted == true or spotted == false:
		enemyHP -= damage_value
		batdamdam.play()
		batflash.play("batflash")
		print(enemyHP)
		if enemyHP <= 0:
			batanim_2.play("batded")
			
	
	
	#knockback is shit
	
func takeknockback():
		if player.islookingup:
			velocity += Vector2.UP * 6500
		if player.islookingdown:
			velocity += Vector2.DOWN * 6500
		if player.islookingleft:
			velocity += Vector2.LEFT * 6500
		if player.islookingright:
			velocity += Vector2.RIGHT * 6500
		move_and_slide()
	
	
	
#enemy exclusive
func _physics_process(delta):

	if spotted == true:
		flapsound.pitch_scale = randf_range(0.9,1.1)
		batshit.play("batsound")
		var diretion = global_position.direction_to(player.global_position)
		velocity = diretion * speed
		move_and_slide()
		batanim.play("BAT_ATTACK")
	if spotted == false:
		velocity = Vector2.ZERO
		move_and_slide()
		batanim.play("bat_idle")
		flapsound.stop()
	
	


func _on_sight_body_entered(body):
	spotted = true



func _on_sight_body_exited(body):
	spotted = false
	
func ded():
	dropitem()
	batanim.visible = false
	batsound.play()
	speed = 0
	enemycollider.disabled = true

func summonparticles():
	var newpartie = particles.instantiate()
	get_tree().root.add_child(newpartie)
	newpartie.scale.y = 0.5
	newpartie.scale.x = 0.5
	newpartie.global_position = self.global_position
	flapsound.stop()
	
	
	
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
		
		
	
