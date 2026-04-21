extends CharacterBody2D

# speed in pixels/sec
var speed = 700 

func _physics_process(_delta):
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
	
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right"):
		direction.y = 0
		$AnimatedSprite2D.play("WalkRight")

	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("WalkLeft")
		direction.y = 0

	elif Input.is_action_pressed("up"):
		direction.x = 0
		$AnimatedSprite2D.play("WalkUp")

	elif Input.is_action_pressed("down"):
		direction.x = 0
		$AnimatedSprite2D.play("WalkDown")

	else:
		direction = Vector2.ZERO
		$AnimatedSprite2D.play("Idle")

#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	velocity = (direction * speed)
	move_and_slide()
