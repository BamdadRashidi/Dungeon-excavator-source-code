extends Camera2D

@onready var player = %player

var camerashakenoise : FastNoiseLite


func _ready():
	camerashakenoise = FastNoiseLite.new()


func setboundaries(centerdir: Vector2):
	"""limit_top = updir
	limit_bottom = downdir
	limit_left = leftdir
	limit_right = rightdir
	print(updir," ",downdir," ",leftdir," ",rightdir)"""
	"""updir : int, downdir: int, leftdir: int, rightdir: int,""" #arguments for method
	global_position = centerdir
	print(global_position)
	
func followplayer():
	global_position = player.global_position



func startSHAKE(intensity: float):
	var cameraoffset = camerashakenoise.get_noise_1d(Time.get_ticks_msec()) * intensity
	offset.x = cameraoffset 
	offset.y = cameraoffset 
