extends CharacterBody2D


const SPEED = 300.0


func movement(delta):
	if Input.is_key_pressed(KEY_D):
		position.x += SPEED *delta
	if Input.is_key_pressed(KEY_A):
		position.x -= SPEED *delta
	if Input.is_key_pressed(KEY_W):
		position.y -= SPEED *delta
	if Input.is_key_pressed(KEY_S):
		position.y += SPEED *delta


func get_input():
	var input_direciton = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direciton * SPEED

func _physics_process(delta):
	get_input()
	movement(delta)
	move_and_collide(velocity * delta)
