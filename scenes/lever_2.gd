extends Node
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
var lever2 = 1
var player = null
func _process(delta: float): 
	if Input.is_action_just_pressed("H key") and player != null:
		if lever2 == 0:
			player.lever2 = true
			print("lever has been activated")
			animation.play("on")
			lever2 = 1
		elif lever2 == 1:
			player.lever2 = false
			animation.play("off")
			lever2 = 0
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = null
	
