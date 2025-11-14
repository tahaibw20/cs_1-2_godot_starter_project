extends Area2D
var direction
var speed = 300
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	

func _physics_process(delta):
	position += direction * speed * delta
	
	
func _on_body_entered(body):
	if body.name == "Player":
		body.change_health(-2)

func set_direction(target):
	direction = position.direction_to(target)
