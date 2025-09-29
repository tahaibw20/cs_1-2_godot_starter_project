extends Node2D
var projectile_scene = preload("res://scenes/projectile.tscn")

var player_in_range = false
# TODO: Add variables for turret state
# Track if player is in range, projectile scene, etc.
# Look at "Boolean Variables and State Tracking" documentation

# TODO: Add projectile scene variable
# Look at "Reusing Projectile Systems" documentation

func _ready():
	timer.wait_time = 2.0
	timer.start()
	pass

func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		print("Player detected!")
		
		
	# TODO: Check if the body is the player
	# Update player detection state
	# Look at "Boolean Variables and State Tracking" documentation
	pass

		
func _on_detection_area_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		print("Player lost!")
	# TODO: Check if the body is the player  
	# Update player detection state
	# Look at "Boolean Variables and State Tracking" documentation
	pass
func _on_shooting_timer_timeout():
	if player_in_range:
		print("Shooting at player!")
	else:
		print("No target in range")
	# TODO: Check if player is in range
	# If yes, shoot at player
	# Look at documentation for shooting logic
	pass

func shoot_at_player():
	new_projectile.global_position = global_position

	new_projectile.set_direction_vector(calculated_direction)

	# TODO: Get player's current position
	# Calculate direction from turret to player
	# Create and launch projectile
	# Look at "Getting Object Positions", "Direction Calculation", 
	# and "Reusing Projectile Systems" documentation
	pass
