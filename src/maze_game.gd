extends CanvasLayer

const charClass = preload("res://src/CharacterBody2D.gd")

@onready var PopUP = $Popup

var person = charClass.new()

func _ready():
	if PopUP.is_visible():
		person.SPEED = 0
		if person.SPEED == 0:
			print("Person speed is 0")


func _on_area_2d_body_entered(body):
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		person.can_move = false


func _on_area_2d_2_body_entered(body):
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		person.can_move = false
