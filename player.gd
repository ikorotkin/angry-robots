extends Area2D

# Player's speed (pixels/sec)
@export var speed: int = 400

# Player's boost factor
@export var boost_factor: int = 4

# Player's boost duration (sec)
@export_range(0, 1, 0.05, "suffix:s", "or_greater")
var boost_time: float = 0.2

# Boost cooldown (sec)
@export_range(0, 5, 0.1, "suffix:s", "or_greater")
var boost_cooldown_time: float = 2

# Player's state (accelerated or not)
var is_boost: bool = false

# Player's state (cooling down after boost or not)
var is_cooldown: bool = false

# Boost timer
var timer_boost := Timer.new()

# Boost cooldown timer
var timer_cooldown := Timer.new()

# Size of the game window
var screen_size: Vector2i


# Called when the node enters
# the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

	# Initialize boost timer
	add_child(timer_boost)
	timer_boost.wait_time = boost_time
	timer_boost.one_shot = true
	timer_boost.connect("timeout", boost_timer_timeout)

	# Initialize cooldown timer
	add_child(timer_cooldown)
	timer_cooldown.wait_time = boost_cooldown_time
	timer_cooldown.one_shot = true
	timer_cooldown.connect("timeout", cooldown_timer_timeout)


# Called every frame.
# 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# The player's velocity vector
	var velocity: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("accelerate"):
		if not is_boost and not is_cooldown:
			timer_boost.start()
			timer_cooldown.start()
			is_boost = true
			is_cooldown = true

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	if is_boost:
		velocity *= boost_factor

	position += velocity * delta

	# Periodic boundaries
	if position.x < 0:
		position.x = screen_size.x
	if position.x > screen_size.x:
		position.x = 0
	if position.y < 0:
		position.y = screen_size.y
	if position.y > screen_size.y:
		position.y = 0


# Called when the boost timer triggered
func boost_timer_timeout() -> void:
	is_boost = false
	print("Boost time out")


# Called when boost cooldown timer triggered
func cooldown_timer_timeout() -> void:
	is_cooldown = false
	print("Cooldown time out")
