extends CharacterBody2D
var maxHealth = 10
var health = maxHealth
var in_range = false
var chasing = false
var attacking = false
#var projectile_original = preload("res://scenes/arrow.tscn")
var speed = 200
@onready var player: CharacterBody2D = $"."
func change_health(_amount:int):
		health += _amount
		if health < 1:
			die()
		if health > maxHealth:
			health = maxHealth
		print("Health: ", health)
		
func die():
	queue_free()

func _ready():
	pass

func _process(delta):
	if in_range:
		pass
		
	elif chasing and !attacking:
		pass
		
	elif chasing and attacking:
		pass
	elif !in_range and !chasing and !attacking:
		pass
		
func _on_melee_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attacking = true
		

func _on_melee_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attacking = false


func _on_chase_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chasing = true
		in_range = false


func _on_chase_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chasing = false
		in_range = true

func _on_ranged_body_entered(body: Node2D) -> void:
	if body. name == "Player":
		in_range = true


func _on_ranged_body_exited(body: Node2D) -> void:
	if body. name == "Player":
		in_range = false
