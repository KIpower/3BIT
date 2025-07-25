class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/Sprite2D/AnimationPlayer"
@onready var audio: AudioStreamPlayer = $"../../Audio/AudioStreamPlayer"

@onready var walk: State_Walk = $"../Walk"
@onready var idle: State_idle = $"../Idle"

func Enter() -> void:
	player.updateAnimation("attack")
	attack_anim.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range( 0.9, 1.1 )
	audio.play()
	
	attacking = true
	

func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass

func Process( _delta: float ) -> State:
	player.velocity = Vector2.ZERO
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

func Physics ( _delta: float ) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null

func EndAttack( _newAnimName : String ) -> void:
	attacking = false
