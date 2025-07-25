class_name State_idle extends State

@onready var walk: State_Walk = $"../Walk"
@onready var attack: State_Attack = $"../Attack"

func Enter() -> void:
	player.updateAnimation("idle")

func Exit() -> void:
	pass

func Process( _delta: float ) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

func Physics ( _delta: float ) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("Attack"):
		return attack
	return null
