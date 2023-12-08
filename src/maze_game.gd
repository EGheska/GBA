extends CanvasLayer

const charClass = preload("res://src/CharacterBody2D.gd")
const solverClass = preload("res://src/popup.gd")


@onready var PopUP = $Popup
@onready var CollisionFisrtDoor = $Control3/Area2D3/StaticBody2D/CollisionShape2D
@onready var AreaCollisionFirstDoor = $Control3/Area2D3/CollisionShape2D
@onready var CollisionSecondDoor = $Control3/Area2D/StaticBody2D/CollisionShape2D
@onready var AreaCollisionSecondDoor = $Control3/Area2D/CollisionShape2D
@onready var CollisionThirdDoor = $Control3/Area2D4/StaticBody2D/CollisionShape2D
@onready var AreaCollisionThirdDoor = $Control3/Area2D4/CollisionShape2D
@onready var CollisionFourthDoor = $Control3/Area2D5/StaticBody2D/CollisionShape2D
@onready var AreaCollisionFourthDoor = $Control3/Area2D5/CollisionShape2D
@onready var AreaCollisionFifthDoor = $Control3/Area2D6/CollisionShape2D
@onready var CollisionFifthDoor = $Control3/Area2D6/StaticBody2D/CollisionShape2D

@onready var FakeAreaCollisionFirstDoor = $Control3/FakedoorArea1/CollisionShape2D
@onready var FakeCollisionFisrtDoor = $Control3/FakedoorArea1/StaticBody2D/CollisionShape2D
@onready var FakeDoorFirst = $Control3/FakedoorArea1/ColorRect2
@onready var FirstDoor = $Control3/Area2D3/ColorRect
@onready var SecondDoor = $Control3/Area2D/ColorRect2
@onready var ThirdDoor = $Control3/Area2D4/ColorRect2
@onready var FourthDoor = $Control3/Area2D5/ColorRect2
@onready var FifthDoor = $Control3/Area2D5/ColorRect2
@onready var LucRato = $Control2/Sprite2D
@onready var controls = $Label

var person = charClass.new()
var solvers = solverClass.new()



func _ready():
	if PopUP.is_visible():
		PopUP.set_visible(false)


func _on_area_2d_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solvers.__set("SecondDoor", 2)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_area_2d_2_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("last door")
		get_tree().paused = true


func _on_area_2d_3_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solverClass.__set("FirstDoor", 1)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("1st func")
		get_tree().paused = true


func _on_popup_visibility_changed():
	if !PopUP.is_visible():
		get_tree().paused = false
		LucRato.set_visible(true)
		controls.set_visible(true)
		if solvers.solved and solvers.doorCounter == 1:
			CollisionFisrtDoor.set_disabled(true)
			FirstDoor.set_color(Color(1, 1, 1, 0))
			AreaCollisionFirstDoor.disabled = true
			AreaCollisionFirstDoor.disconnect("body_enter", _on_area_2d_3_body_entered)
		if solvers.solved and solvers.doorCounter == 2:
			CollisionSecondDoor.set_disabled(true)
			SecondDoor.set_color(Color(1,1,1,0))
			AreaCollisionSecondDoor.disabled = true
			AreaCollisionSecondDoor.disconnect("body_enter", _on_area_2d_body_entered)
		if solvers.solved and solvers.doorCounter == 3:
			CollisionThirdDoor.set_disabled(true)
			ThirdDoor.set_color(Color(1,1,1,0))
			AreaCollisionThirdDoor.disabled = true
			AreaCollisionThirdDoor.disconnect("body_enter", _on_area_2d_4_body_entered)
		if solvers.solved and solvers.doorCounter == 4:
			CollisionFourthDoor.set_disabled(true)
			FourthDoor.set_color(Color(1,1,1,0))
			AreaCollisionFourthDoor.disabled = true
			AreaCollisionFourthDoor.disconnect("body_enter", _on_area_2d_5_body_entered)
		if solvers.solved and solvers.doorCounter == 100:
			FakeCollisionFisrtDoor.set_disabled(true)
			FakeDoorFirst.set_color(Color(1,1,1,0))
			FakeAreaCollisionFirstDoor.disabled = true
			FakeAreaCollisionFirstDoor.disconnect("body_enter", _on_fakedoor_area_1_body_entered)
		if solvers.solved and solvers.doorCounter == 5:
			CollisionFifthDoor.set_disabled(true)
			FifthDoor.set_color(Color(1,1,1,0))
			AreaCollisionFifthDoor.disabled = true
			AreaCollisionFifthDoor.disconnect("body_enter", _on_fakedoor_area_1_body_entered)
		


func _on_area_2d_4_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solvers.__set("ThirdDoor", 3)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_fakedoor_area_1_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solvers.__set("FakeDoor1", 100)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_area_2d_5_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solvers.__set("FourthDoor", 4)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_area_2d_6_body_entered(body):
	LucRato.set_visible(false)
	controls.set_visible(false)
	solvers.__set("FifthDoor", 5)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true
