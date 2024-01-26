extends CanvasLayer

var levelCounter = LevelSelelctor.new()
var config = ConfigFile.new()
var history = []

var stackClass = load("res://levelCounter.gd")

func _ready():
	config.load("res://settings2.cfg")
	if GlobalScript.mazelevelCounter == 0:
		GlobalScript.mazelevelCounter = 1
	elif GlobalScript.mazelevelCounter == 1:
		GlobalScript.mazelevelCounter = 2
	elif GlobalScript.mazelevelCounter == 2:
		GlobalScript.mazelevelCounter = 3

func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_button_2_pressed():
	if GlobalScript.mazelevelCounter == 1:
		print("maze level counter = " + str(GlobalScript.mazelevelCounter))
		get_tree().change_scene_to_file("res://src/appdata/maze_game_lvl2.tscn")
	elif GlobalScript.mazelevelCounter == 2:
		print("maze level counter = " + str(GlobalScript.mazelevelCounter))
		get_tree().change_scene_to_file("res://src/appdata/maze_lvl3.tscn")
	elif GlobalScript.mazelevelCounter == 3:
		print("maze level counter = " + str(GlobalScript.mazelevelCounter))
		$Control/Button2.disabled = true
