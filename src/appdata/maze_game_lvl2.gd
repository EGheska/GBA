extends CanvasLayer

const charClass = preload("res://src/appdata/CharacterBody2D.gd")
const solverClass = preload("res://src/appdata/popup.gd")

@onready var PopUP = $Popup

var solvers = solverClass.new()

func _ready():
	if PopUP.is_visible():
		PopUP.set_visible(false)
	solvers.setLevelCounter(2)


func _on_fisrt_door_body_entered(body):
	#LucRato.set_visible(false)
	#controls.set_visible(false)
	solvers.solved = false
	solvers.__set("FirstDoor", 1)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_second_door_body_entered(body):
	pass # Replace with function body.


func _on_third_door_body_entered(body):
	pass # Replace with function body.


func _on_fourth_door_body_entered(body):
	pass # Replace with function body.
