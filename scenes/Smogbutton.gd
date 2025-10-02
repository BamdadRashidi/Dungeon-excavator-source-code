extends CharacterBody2D

@onready var smog = $".."
@onready var buttoncolli = $buttoncolli
@onready var static_body_2d = $"../StaticBody2D"
@onready var smogcolli = $"../smogcolli"
@onready var staticcolli = $"../StaticBody2D/staticcolli"

@onready var parties = $"../parties"

# Called when the node enters the scene tree for the first time.
func _ready():
	smog.monitorable = true
	smog.monitoring = true
	buttoncolli.disabled = false
	smogcolli.disabled = false
	staticcolli.disabled = false
	parties.emitting = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func takedamage(damage_value: float):
	smog.monitorable = false
	smog.monitoring = false
	buttoncolli.disabled = true
	staticcolli.disabled = true
	smogcolli.disabled = true
	static_body_2d.queue_free()
	queue_free()
	parties.emitting = false

func takeknockback():
	pass
