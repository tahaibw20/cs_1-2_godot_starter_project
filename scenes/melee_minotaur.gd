extends CharacterBody2D
var maxHealth = 10
var health = maxHealth
var in_range = false
var chasing = false
var attacking = false
var projectile_original = preload("res://scenes/enemy_arrow.tscn")
var speed = 250
var start_time = 2
var timer = start_time
var player = null
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var facing = "right"
var attack_timer = 1

#@onready var player: CharacterBody2D = $"."
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
	if player !=null:
		if in_range:
			timer -= delta
			if timer < 0:
				timer = start_time
				shoot()
		elif chasing and !attacking:
			position=position.move_toward(player.position, speed*delta)
		elif chasing and attacking:
			attacking = true
			attack_timer -=delta
			if attack_timer < 0:
				attack_timer = 1
				player.change_health (-2)
		elif !in_range and !chasing and !attacking:
			pass
		if abs(position.x - player.position.x) < abs(position.y - player.position.y):
			if position.y > player.position.y:
				facing = "up"
			else: facing = "down"
		else:
			if position.x > player.position.x:
				facing = "left"
			else: facing = "right"
			update_animation()
func update_animation():
	if in_range:
		anim.play("crossbow_shoot_" + facing)
	elif attacking:
		anim.play("attack_" + facing)
	elif chasing:
		anim.play("walk_" + facing)
	else: 
		anim.play("crossbow_idle_" + facing)
	
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

func _on_ranged_body_entered(body: Node2D):
	if body.name == "Player":
		player = body
		in_range = true
		print("inrange")


func _on_ranged_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false

func shoot():
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position
	
	# TODO: Set projectile direction using facing variable
	projectile_clone.set_direction(player.position)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)
