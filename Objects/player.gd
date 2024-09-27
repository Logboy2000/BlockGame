extends CharacterBody3D


const SPEED = 5.0
const DECCELERATION = 1
const JUMP_VELOCITY = 4.5

@onready var head: Node3D = $Head
@export var invert_mouse_y: bool = false
@export var mouse_sensitivity : float = 0.1

var forward_direction := 0

var mouse_input = Vector2(0,0)

func _physics_process(delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("up", "down", "left", "right")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction != Vector3.ZERO:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	
	
	handle_head_rotation()
	
	
	move_and_slide()
func handle_head_rotation():
	head.rotation_degrees.y -= mouse_input.x * mouse_sensitivity
	head.rotation.x = clamp(head.rotation.x, deg_to_rad(-90), deg_to_rad(90))
