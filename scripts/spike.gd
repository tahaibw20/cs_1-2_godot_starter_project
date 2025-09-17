extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.change_health(-10)
		("Player hit spikes!")
	# TODO: Make the player take damage
	# Call the player's health change function: body.change_health(-10)
	
	
	# TODO: Print a message about the spike hit
	# Something like: print("Player hit spikes!")
