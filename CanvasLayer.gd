class_name Solver extends CanvasLayer

@onready var textLabel = $Control/Label
@onready var codetoSolve = $Control/CodeToSolve
@onready var cheetSheet = $Control/CheetSheet
@onready var lineEdit = $Control/LineEdit


const firstCode = "2163"
const secondCode = "123"

static var whichDoor
static var doorCounter
var solved = false


static func __set(property, value):
	whichDoor = property
	doorCounter = value
	
static func __get():
	return whichDoor


func _ready():
	pass


func _on_line_edit_text_submitted(new_text):
	if new_text == firstCode: # if new_text == dictionary(doorCounter)
		var t = Timer.new()
		textLabel.set_text("Congratulations!\n You have solved the first code!")
		solved = true
		print(solved)
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		await t.timeout
		print("Timeout")
		get_tree().change_scene_to_file("res://src/maze_game.tscn")
		textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
		lineEdit.clear()	
	else:
		textLabel.set_text("The code does not match.\n Maybe, try one more time?")


func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\n You can find a key for decipher the code in the message left for you.\n Use that to so")
