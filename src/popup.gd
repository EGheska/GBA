class_name solver extends Popup

@onready var textLabel = $Control/Label
@onready var codetoSolve = $Control/CodeToSolve
@onready var cheetSheet = $Control/CheetSheet
@onready var lineEdit = $Control/LineEdit


const firstCode = "1"
const secondCode = "6452"

static var whichDoor
static var doorCounter
static var solved

static func _set_solve(value):
	solved = value

static func __set(property, value):
	whichDoor = property
	doorCounter = value
	
static func __get():
	return whichDoor

func _ready():
	pass

func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\n You can find a key for decipher the code in the message left for you.\n Use that to so")


func _on_line_edit_text_submitted(new_text):
	if new_text == firstCode: # if new_text == dictionary(doorCounter)
		var t = Timer.new()
		textLabel.set_text("Congratulations!\n You have solved the first code!")
		print(solved)
		_set_solve(true)
		print(solved)
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		await t.timeout
		print("Timeout")
		self.set_visible(false)
		textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
		lineEdit.clear()	
	else:
		textLabel.set_text("The code does not match.\n Maybe, try one more time?")

func _on_visibility_changed():
	print(whichDoor, doorCounter)
	lineEdit.clear()
	textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
	
	match doorCounter:
		1:
			codetoSolve.texture = ResourceLoader.load("res://code1Maz`e.png")
		2:
			codetoSolve.texture = ResourceLoader.load("res://code2Maze.PNG")
		3:
			codetoSolve.texture = ResourceLoader.load("res://code3Maze.PNG")
		4:
			codetoSolve.texture = ResourceLoader.load("res://code4Maze.png")
		5:
			codetoSolve.texture = ResourceLoader.load("res://code5Maze.png")
		6:
			codetoSolve.texture = ResourceLoader.load("res://code6Maze.png")
	
