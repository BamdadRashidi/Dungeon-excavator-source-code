extends CharacterBody2D
var islit = false
@onready var torch_anim = $torch_anim
@onready var torchsound = $torchsound
@onready var torchsoun_d = $"torchsoun d"
@onready var thingy = $thingy
@onready var thingycolli = $thingy/thingycolli
@onready var torchlight = $torchlight

# Called when the node enters the scene tree for the first time.
func _ready():
	torchlight.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if islit == true:
		torch_anim.play("on")
		torchsoun_d.play("torchaudio")
		torchlight.visible = true

	else:
		torch_anim.play("off")
		torchsound.stop()

		
func Lightup():
	islit = true
	
func addup():
	print("EL MAO")
