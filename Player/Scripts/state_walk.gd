class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle: State_idle = $"../Idle"

func Enter() -> void:
	player.updateAnimation("walk")

func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.setDirection():
		player.updateAnimation('walk')
	return null

func HandleInput(_event: InputEvent) -> State:
	return null
