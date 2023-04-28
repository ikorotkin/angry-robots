extends CanvasLayer


# Notifies `Main` node that the button has been pressed
signal start_game


# Called when the node enters
# the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame.
# 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Shows the message 'text' and starts the message timer
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


# Shows 'Game Over' sequence
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down
	await $MessageTimer.timeout

	$Message.text = "Angry Robots"
	$Message.show()

	# Make a one-shot timer and wait for it to finish
	await get_tree().create_timer(1.0).timeout
	$StartButton.show() # Show the button


# Updates the score label
func update_score(score):
	$ScoreLabel.text = "Score: " + str(score)


# Updates the highest score label
func update_highest_score(score):
	$HighestScoreLabel.text = "Highest score: " + str(score)


# Called when the message timer triggers
func _on_message_timer_timeout() -> void:
	$Message.hide()


# Called when the 'Start' button pressed
func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
