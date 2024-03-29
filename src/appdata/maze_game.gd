extends CanvasLayer

const charClass = preload("res://src/appdata/CharacterBody2D.gd")
const solverClass = preload("res://src/appdata/popup.gd")


@onready var PopUP = $Popup
# Collisions
@onready var CollisionFisrtDoor = $Control3/Area2D3/StaticBody2D/CollisionShape2D
@onready var AreaCollisionFirstDoor = $Control3/Area2D3/CollisionShape2D
@onready var CollisionSecondDoor = $Control3/Area2D/StaticBody2D/CollisionShape2D
@onready var AreaCollisionSecondDoor = $Control3/Area2D/CollisionShape2D
@onready var CollisionThirdDoor = $Control3/Area2D4/StaticBody2D/CollisionShape2D
@onready var AreaCollisionThirdDoor = $Control3/Area2D4/CollisionShape2D
@onready var AreaCollisionThirdDoor2 = $Control3/Area2D4/CollisionShape2D2
@onready var CollisionFourthDoor = $Control3/Area2D5/StaticBody2D/CollisionShape2D
@onready var AreaCollisionFourthDoor = $Control3/Area2D5/CollisionShape2D
@onready var AreaCollisionFourthDoor2 = $Control3/Area2D5/CollisionShape2D2
@onready var AreaCollisionFifthDoor = $Control3/Area2D6/CollisionShape2D
@onready var CollisionFifthDoor = $Control3/Area2D6/StaticBody2D/CollisionShape2D
@onready var AreaCollisionSixthDoor = $Control3/Area2D7/CollisionShape2D
@onready var AreaCollisionSixthDoor2 = $Control3/Area2D7/CollisionShape2D2
@onready var CollisionSixthDoor = $Control3/Area2D7/StaticBody2D/CollisionShape2D

@onready var FakeAreaCollisionFirstDoor = $Control3/FakedoorArea1/CollisionShape2D
@onready var FakeCollisionFisrtDoor = $Control3/FakedoorArea1/StaticBody2D/CollisionShape2D
@onready var FakeDoorFirst = $Control3/FakedoorArea1/ColorRect2
@onready var FakeAreaCollisionSecondDoor = $Control3/FakedoorArea2/CollisionShape2D
@onready var FakeDoorSecond = $Control3/FakedoorArea2/ColorRect
@onready var FakeCollisionSecondDoor = $Control3/FakedoorArea2/StaticBody2D/CollisionShape2D
@onready var FakeAreaCollisionThirdDoor = $Control3/FakedoorArea3/CollisionShape2D
@onready var FakeCollisionThirdDoor = $Control3/FakedoorArea3/StaticBody2D/CollisionShape2D
@onready var FakeThirdDoor = $Control3/FakedoorArea3/ColorRect

@onready var FirstDoor = $Control3/Area2D3/ColorRect
@onready var SecondDoor = $Control3/Area2D/ColorRect2
@onready var ThirdDoor = $Control3/Area2D4/ColorRect2
@onready var FourthDoor = $Control3/Area2D5/ColorRect2
@onready var FifthDoor = $Control3/Area2D6/ColorRect2
@onready var SixthDoor = $Control3/Area2D7/ColorRect

@onready var scoreItself = $Control2/ScoreItslef

@onready var LeaveScene = $Popup2

@onready var LucRato = $Control2/TextureRect
@onready var controls = $Label



var person = charClass.new()
var solvers = solverClass.new()
var t_begin_the_game
var t_end_the_game

var stackClass = load("res://levelCounter.gd")
var config = ConfigFile.new()
func _ready():
	config.load("res://settings.cfg")
	if config.get_value("language", "mode") == "dutch":
		$Button.text = "Terug"
	
	if PopUP.is_visible():
		PopUP.set_visible(false)
	solvers.setLevelCounter(1)
#
#
#func timer_score():
#	await get_tree().crea

func _on_area_2d_body_entered(body):
	
	
	solvers.solved = false
	solvers.__set("SecondDoor", 2)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("second func")
		get_tree().paused = true


func _on_area_2d_2_body_entered(body):
	
	solvers.solved = false
	
	solverClass.__set("FinalDoor", 500)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("last door")
		get_tree().paused = true


func _on_area_2d_3_body_entered(body):
	
	solvers.solved = false
	solverClass.__set("FirstDoor", 1)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		#print("1st func")
		get_tree().paused = true


func _on_popup_visibility_changed():
	if !PopUP.is_visible():
		get_tree().paused = false
		
		
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
			AreaCollisionThirdDoor2.disabled = true
			AreaCollisionThirdDoor2.disconnect("body_enter", _on_area_2d_4_body_entered)
			AreaCollisionThirdDoor.disconnect("body_enter", _on_area_2d_4_body_entered)
		if solvers.solved and solvers.doorCounter == 4:
			print(solvers.solved)
			CollisionFourthDoor.set_disabled(true)
			FourthDoor.set_color(Color(1,1,1,0))
			AreaCollisionFourthDoor.disabled = true
			AreaCollisionFourthDoor.disconnect("body_enter", _on_area_2d_5_body_entered)
			AreaCollisionFourthDoor2.disabled = true
			AreaCollisionFourthDoor2.disconnect("body_enter", _on_area_2d_5_body_entered)
		if solvers.solved and solvers.doorCounter == 5:
			CollisionFifthDoor.set_disabled(true)
			AreaCollisionFifthDoor.disabled = true
			FifthDoor.set_color(Color(1,1,1,0))
			AreaCollisionFifthDoor.disconnect("body_enter", _on_area_2d_6_body_entered)
		if solvers.solved and solvers.doorCounter == 100:
			FakeCollisionFisrtDoor.set_disabled(true)
			FakeDoorFirst.set_color(Color(1,1,1,0))
			FakeAreaCollisionFirstDoor.disabled = true
			FakeAreaCollisionFirstDoor.disconnect("body_enter", _on_fakedoor_area_1_body_entered)
		if solvers.solved and solvers.doorCounter == 200:
			FakeCollisionSecondDoor.set_disabled(true)
			FakeDoorSecond.set_color(Color(1,1,1,0))
			FakeAreaCollisionSecondDoor.disabled = true
			FakeAreaCollisionSecondDoor.disconnect("body_enter", _on_fakedoor_area_2_body_entered)
		if solvers.solved and solvers.doorCounter == 300:
			FakeCollisionThirdDoor.set_disabled(true)
			FakeThirdDoor.set_color(Color(1,1,1,0))
			FakeAreaCollisionThirdDoor.disabled = true
			FakeAreaCollisionThirdDoor.disconnect("body_enter", _on_fakedoor_area_3_body_entered)
		if solvers.solved and solvers.doorCounter == 6:
			CollisionSixthDoor.set_disabled(true)
			AreaCollisionSixthDoor.disabled = true
			AreaCollisionSixthDoor2.disabled = true
			SixthDoor.set_color(Color(1,1,1,0))
			AreaCollisionSixthDoor.disconnect("body_enter", _on_area_2d_7_body_entered)
			AreaCollisionSixthDoor2.disconnect("body_enter", _on_area_2d_7_body_entered)
		if solvers.solved and solvers.doorCounter == 500:
#			t_end_the_game = Time.get_ticks_msec()
			#stackClass.push(1)
			get_tree().change_scene_to_file("res://src/appdata/maze_win_1st.tscn")
			
#func _process(delta):
#	t_end_the_game = Time.get_ticks_msec()
#	var temp = count_result()/1000
#	scoreItself.text = str(temp)
#	print(temp)
#
#func count_result():
#	var result = t_end_the_game - t_begin_the_game
#	return result

func _on_area_2d_4_body_entered(body):
	solvers.solved = false
	solvers.__set("ThirdDoor", 3)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true

func _on_fakedoor_area_1_body_entered(body):
	
	
	solvers.__set("FakeDoor1", 100)
	solvers.solved = false
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_area_2d_5_body_entered(body):
	
	
	solvers.__set("FourthDoor", 4)
	solvers.solved = false
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_area_2d_6_body_entered(body):
	
	
	solvers.__set("FifthDoor", 5)
	solvers.solved = false
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_area_2d_7_body_entered(body):
	
	
	solvers.solved = false
	solvers.__set("SixthDoor", 6)
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_fakedoor_area_2_body_entered(body):
	
	
	solvers.__set("FakeDoor2", 200)
	solvers.solved = false
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true


func _on_fakedoor_area_3_body_entered(body):
	
	
	solvers.__set("FakeDoor3", 300)
	solvers.solved = false
	if !PopUP.is_visible():
		PopUP.set_visible(true)
		PopUP.popup_centered()
		get_tree().paused = true

func _on_button_pressed():
	LeaveScene.set_visible(true)
	LeaveScene.popup_centered()
