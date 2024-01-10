extends CanvasLayer

const charClass = preload("res://src/appdata/CharacterBody2D.gd")
const solverClass = preload("res://src/appdata/popup.gd")

# Actual doors
@onready var FirstDoor = $Control2/FisrtDoor/StaticBody2D/CollisionShape2D
@onready var SecondDoor = $Control2/SecondDoor/StaticBody2D/CollisionShape2D
@onready var ThirdDoor = $Control2/ThirdDoor/StaticBody2D/CollisionShape2D
@onready var FourthDoor = $Control2/FourthDoor/StaticBody2D/CollisionShape2D
@onready var FifthDoor = $Control2/FifthDoor/StaticBody2D/CollisionShape2D
@onready var SixthDoor = $Control2/SixthDoor/StaticBody2D/CollisionShape2D
@onready var FinalDoor = $Control2/FinalDoor/StaticBody2D/CollisionShape2D

# Area collisions
@onready var AreaCollision1 = $Control2/FisrtDoor/CollisionShape2D
@onready var AreaCollision2 = $Control2/SecondDoor/CollisionShape2D
@onready var AreaCollision3 = $Control2/ThirdDoor/CollisionShape2D
@onready var AreaCollision4 = $Control2/FourthDoor/CollisionShape2D
@onready var AreaCollision5 = $Control2/FifthDoor/CollisionShape2D
@onready var AreaCollision5and2 = $Control2/FifthDoor/CollisionShape2D2
@onready var AreaCollision6 = $Control2/SixthDoor/CollisionShape2D
@onready var AreaCollisionFinal = $Control2/FinalDoor/CollisionShape2D

#color textures
@onready var FisrtColor = $Control2/FisrtDoor/ColorRect
@onready var SecondColor = $Control2/SecondDoor/ColorRect
@onready var ThirdColor = $Control2/ThirdDoor/ColorRect
@onready var FourthColor = $Control2/FourthDoor/ColorRect
@onready var FifthColor = $Control2/FifthDoor/ColorRect
@onready var SixthColor = $Control2/SixthDoor/ColorRect
@onready var FinalColor = $Control2/FinalDoor/ColorRect

@onready var FakeColor1 = $Control2/FakeDoor1/ColorRect
@onready var FakeColor2 = $Control2/FakeDoor2/ColorRect
@onready var FakeColor3 = $Control2/FakeDoor3/ColorRect
@onready var FakeColor4 = $Control2/FakeDoor4/ColorRect

#Fake doors
@onready var FakeDoor1 = $Control2/FakeDoor1/StaticBody2D/CollisionShape2D
@onready var FakeDoor2 = $Control2/FakeDoor2/StaticBody2D/CollisionShape2D
@onready var FakeDoor3 = $Control2/FakeDoor3/StaticBody2D/CollisionShape2D
@onready var FakeDoor4 = $Control2/FakeDoor4/StaticBody2D/CollisionShape2D

@onready var PopUP = $Popup

@onready var LeaveScene = $Popup2

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
	solvers.solved = false
	solvers.__set("SecondDoor", 2)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_third_door_body_entered(body):
	solvers.solved = false
	solvers.__set("ThirdDoor", 3)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_fourth_door_body_entered(body):
	solvers.solved = false
	solvers.__set("FourthDoor", 4)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_fifth_door_body_entered(body):
	solvers.solved = false
	solvers.__set("FifthDoor", 5)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true



func _on_final_door_body_entered(body):
	solvers.solved = false
	solvers.__set("FinalDoor", 7)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_sixth_door_body_entered(body):
	solvers.solved = false
	solvers.__set("SixthDoor", 6)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_popup_visibility_changed():
	if !PopUP.is_visible():
		get_tree().paused = false
		print("Pop up visibility changed")
		#ucRato.set_visible(true)
		#controls.set_visible(true)
		if solvers.solved and solvers.doorCounter == 1:
			AreaCollision1.disabled = true
			AreaCollision1.disconnect("body_enter", _on_fisrt_door_body_entered)
			FirstDoor.set_disabled(true)
			FisrtColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 2:
			AreaCollision2.disabled = true
			AreaCollision2.disconnect("body_enter", _on_second_door_body_entered)
			SecondDoor.set_disabled(true)
			SecondColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 3:
			AreaCollision3.disabled = true
			AreaCollision3.disconnect("body_enter", _on_third_door_body_entered)
			ThirdDoor.set_disabled(true)
			ThirdColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 4:
			AreaCollision4.disabled = true
			AreaCollision4.disconnect("body_enter", _on_fourth_door_body_entered)
			FourthDoor.set_disabled(true)
			FourthColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 5:
			AreaCollision5.disabled = true
			AreaCollision5and2.disabled = true
			AreaCollision5.disconnect("body_enter", _on_fifth_door_body_entered)
			AreaCollision5and2.disconnect("body_enter", _on_fifth_door_body_entered)
			FifthDoor.set_disabled(true)
			FifthColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 6:
			AreaCollision6.disabled = true
			AreaCollision6.disconnect("body_enter", _on_sixth_door_body_entered)
			SixthDoor.set_disabled(true)
			SixthColor.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 7:
#			AreaCollisionFinal.disabled = true
#			AreaCollisionFinal.disconnect("body_enter", _on_final_door_body_entered)
#			FinalDoor.set_disabled(true)
#			FinalColor.set_color(Color(1,1,1,0))
			get_tree().change_scene_to_file("res://src/appdata/maze_win_1st.tscn")
		if solvers.solved and solvers.doorCounter == 100:
			FakeDoor1.disabled = true
			FakeDoor1.disconnect("body_enter", _on_fake_door_1_body_entered)
			FakeColor1.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 200:
			FakeDoor2.disabled = true
			FakeDoor2.disconnect("body_enter", _on_fake_door_2_body_entered)
			FakeColor2.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 300:
			FakeDoor3.disabled = true
			FakeDoor3.disconnect("body_enter", _on_fake_door_3_body_entered)
			FakeColor3.set_color(Color(1,1,1,0))
		if solvers.solved and solvers.doorCounter == 400:
			FakeDoor4.disabled = true
			FakeDoor4.disconnect("body_enter", _on_fake_door_4_body_entered)
			FakeColor4.set_color(Color(1,1,1,0))
			
			

func _on_fake_door_1_body_entered(body):
	solvers.solved = false
	solvers.__set("FakeDoor1", 100)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_fake_door_2_body_entered(body):
	solvers.solved = false
	solvers.__set("FakeDoor2", 200)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true

func _on_fake_door_3_body_entered(body):
	solvers.solved = false
	solvers.__set("FakeDoor3", 300)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_fake_door_4_body_entered(body):
	solvers.solved = false
	solvers.__set("FakeDoor4", 400)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_button_pressed():
	LeaveScene.set_visible(true)
	LeaveScene.popup_centered()
