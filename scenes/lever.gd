extends Node
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var lever1 = 0
var player = null

func _ready() -> void:
	animation.play("off")

func _process(delta: float): 
	if Input.is_action_just_pressed("H key") and player != null:
		if lever1 == 0:
			player.lever1 = true
			print("lever has been activated")
			animation.play("on")
			lever1 = 1
		elif lever1 == 1:
			player.lever1 = false
			animation.play("off")
			lever1 = 0
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = null
