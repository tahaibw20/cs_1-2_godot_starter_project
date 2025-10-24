extends Node
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var lever3 = 1
var player = null
func _process(delta: float): 
	if Input.is_action_just_pressed("H key") and player != null:
		if lever3 == 0:
			player.lever3 = true
			print("lever has been activated")
			animation.play("on")
			lever3 = 1
		elif lever3 == 1:
			player.lever3 = false
			animation.play("off")
			lever3 = 0
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = null
