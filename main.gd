extends Node


# Used to instantiate the Mob scene
@export var mob_scene: PackedScene

# Counts the score
var score: int

# Tracks the highest score
var highest_score: int = 0


# Called when the node enters
# the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame.
# 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Called when the player collides with enemy
func _on_player_hit(body: Node2D) -> void:
	if $Player.is_boost:
		print("Enemy got hit!")
		score += 10
		$HUD.update_score(score)
		body.modulate = Color(0.5, 0, 0)
		body.gravity_scale = 1
	else:
		print("Game over!")
		game_over()


# Called when the player loses
func game_over():
	$Player.hide()

	# Disables collision detection
	var collision_shape = $Player.find_child("CollisionShape2D")
	collision_shape.set_deferred("disabled", true)

	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

	# Updates the highest score
	if score > highest_score:
		highest_score = score
		$HUD.update_highest_score(highest_score)


# Initializes a new game
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Ready?")
	get_tree().call_group("mobs", "queue_free")


# Triggers every 0.5 sec and instantiates a mob
func _on_mob_timer_timeout() -> void:
	# Create a new instance of the Mob scene
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D
	var mob_spawn_location = get_node("MobSpawnPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene
	add_child(mob)


# Increments the score by 1 every second
func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


# Starts the game
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
