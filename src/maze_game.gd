extends CanvasLayer

const charClass = preload("res://src/CharacterBody2D.gd")
const solverClass = preload("res://src/popup.gd")


@onready var PopUP = $Popup
@onready var CollisionFisrtDoor = $Area2D3/StaticBody2D/CollisionShape2D
@onready var AreaCollisionFirstDoor = $Area2D3/CollisionShape2D
@onready var FirstDoor = $Area2D3/ColorRect

var person = charClass.new()
var solvers = solverClass.new()



func _ready():
	pass


func _on_area_2d_body_entered(body):
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		print("fist func")
		get_tree().paused = true


func _on_area_2d_2_body_entered(body):
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		print("2nd func")
		get_tree().paused = true


func _on_area_2d_3_body_entered(body):
	
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		print("3rd func")
		get_tree().paused = true


func _on_popup_visibility_changed():

	if !PopUP.is_visible():
		get_tree().paused = false
		CollisionFisrtDoor.set_disabled(true)
		FirstDoor.set_color(Color(1, 1, 1, 0))
		AreaCollisionFirstDoor.disabled = true
		AreaCollisionFirstDoor.disconnect("body_enter", _on_area_2d_3_body_entered)
		print("the collision is disabled")
