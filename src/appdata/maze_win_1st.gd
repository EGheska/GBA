extends CanvasLayer

var levelCounter = LevelSelelctor.new()
var config = ConfigFile.new()
var history = []

var stackClass = load("res://levelCounter.gd")

func _ready():
	config.load("res://settings2.cfg")
	

func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_button_2_pressed():
	print("Button has been pressed")
	var a = stackClass.pop()
	print("The value printed from a stack:",a)
	if stackClass.pop() == 1:
		print("Stack got 1")
		get_tree().change_scene_to_file("res://src/appdata/maze_game_lvl2.tscn")
	elif stackClass.pop() == 2:
		print("Stack got 2")
		get_tree().change_scene_to_file("res://src/appdata/maze_lvl3.tscn")
	elif stackClass.pop() == 3:
		print("Stack got 3")
		get_tree().change_scene_to_file("res://src/gui/main_menu.tscn")
