extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Celeste dash
const DASH_AMT: float = 1000
const DASH_TIME: float = 0.16

#extra time for player to jump after going off of a platform
@onready var coyote_timer = $coyotetimer
var was_on_floor = is_on_floor()

var can_dash: bool = true
var is_dashing: bool = false
var dash_dir: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0

@onready var player = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		if !is_dashing:
			velocity += get_gravity() * delta
	
	was_on_floor = is_on_floor()

	_dash_logic(delta)

	# reset CELESTE DASH
	if is_on_floor():
		if !is_dashing and !can_dash:
			can_dash = true
			_update_dash_visuals()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !is_dashing:
		var direction := Input.get_axis("move_left", "move_right")

		#animations
		if direction > 0:
			player.flip_h = false
		elif direction < 0:
			player.flip_h = true
		
		if is_on_floor():
			if direction == 0:
				player.play("idle")
			else:
				player.play("run")
		else:
			if velocity.y <= 0:
				player.play("jump")
			else: 
				player.play("fall")
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

	if was_on_floor and !is_on_floor():
		coyote_timer.start()
		
func _update_dash_visuals() -> void:
	if can_dash:
		player.play("fall")
	else:
		player.play("dash")

# retrieves what directions youre inputting in order to get what you need from the celeste dash
func _dash_logic(delta: float) -> void:
	var input_dir: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("jump", "move_down")
	).normalized()

	if input_dir.x != 0:
		dash_dir.x = input_dir.x

	if can_dash and Input.is_action_just_pressed("dash"):
		var final_dash_dir: Vector2 = dash_dir
		if input_dir.y != 0 and input_dir.x == 0:
			final_dash_dir.x = 0
		final_dash_dir.y = input_dir.y

		can_dash = false
		is_dashing = true
		dash_timer = DASH_TIME
		
		_update_dash_visuals()
		velocity = final_dash_dir * DASH_AMT

	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
			velocity.y *= 0.3
