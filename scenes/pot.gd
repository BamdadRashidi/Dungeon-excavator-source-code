extends CharacterBody2D
@onready var player = %player
@onready var roottransitioncamera = %roottransitioncamera

@onready var potcolli = $potcolli
@onready var pot_anim = $"pot anim"

@onready var potanim = $potanim

@onready var potbreak = $potbreak



var Hp_item = preload("res://scenes/heart_item.tscn")
var arrow_item = preload("res://scenes/arrow_item.tscn")
var bomb_item = preload("res://scenes/bomb_item.tscn")

var rngjesus = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pot_anim.play("default")

	

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	pass




	


func takedamage(damdam):
	pot_anim.play("broken")
	potbreak.pitch_scale = randf_range(0.9,1.1)
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(roottransitioncamera.startSHAKE,0.05,1.0,0.2)
	potcolli.disabled = true
	potanim.play("new_animation")
	
func takeknockback():
	pass





func dropitem():
	rngjesus.randomize()

	var generalrando = rngjesus.randi_range(1,40)
	print(generalrando)
	if generalrando >= 1 and generalrando <= 10 and player.gotbow == true:
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
	if generalrando >= 31 and generalrando <= 40 and player.gotbombs == true:
		var bombclone = bomb_item.instantiate()
		get_tree().root.add_child(bombclone)
		bombclone.global_position = self.global_position
		print("bombs")
		


	
	
