extends Sprite2D

@onready var _enemyfollow :PathFollow2D = get_parent()
@onready var enemy_lap_label = _enemyfollow.get_parent().get_parent().get_child(1)

var time_steps = (1/120)

# Opponent speed variable
var _speed :float = 800 #135

# Variables for lap incrementing
var new_enemy_lap = false 
var enemy_lap_counter = 0


func _init():
	pass

func _ready():
	enemy_lap_counter = 1
	enemy_lap_label.text = "Enemy Lap: " + str(enemy_lap_counter) + "/" + str(GlobalScript.max_laps)
	_physics_process(time_steps)


func _physics_process(delta):
	_enemyfollow.set_progress(_enemyfollow.get_progress() + _speed * delta)
	_increment_enemy_lap_counter()
	_check_for_finish()

func _check_for_finish():
	if(enemy_lap_counter == GlobalScript.max_laps and _enemyfollow.get_progress_ratio() >= 0.99):
		GlobalScript.enemy_finished = true

func _increment_enemy_lap_counter():
	# Increments lap counter
	if(_enemyfollow.get_progress_ratio() <= 0.05 and new_enemy_lap == true):
		enemy_lap_counter += 1
		new_enemy_lap = false
		# sets looping to false after final lap has been reached
		if(enemy_lap_counter >= GlobalScript.max_laps):
			_enemyfollow.set_loop(false)
		enemy_lap_label.text = "Enemy Lap: " + str(enemy_lap_counter) + "/" + str(GlobalScript.max_laps)
	
	if(_enemyfollow.get_progress_ratio() >= 0.9):
		new_enemy_lap = true 

