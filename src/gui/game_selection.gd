extends CanvasLayer

@onready var ThisTile = $"."
@onready var SettingsMenu = $"SettingsMenu"

@onready var BackButton = $GameSelection/MarginContainer/VBoxContainer/BackButton
@onready var SettingButton = $GameSelection/MarginContainer/VBoxContainer/SettingsButton

@onready var mathGame = $GameSelection/MarginContainer/HBoxContainer/MathGame
@onready var mazeGame = $GameSelection/MarginContainer/HBoxContainer/MazeGame
@onready var gamename = $GameSelection/MarginContainer/VBoxContainer3/HBoxContainer2/Label

@onready var pauseMenu = $CanvasLayer

var config = ConfigFile.new()

func _ready():
	config.load("res://settings.cfg")

	if config.get_value("language", "mode") == "dutch":	
		$GameSelection/MarginContainer/VBoxContainer3/HBoxContainer/BackButton.text = "Terug"
		gamename.text = "De Minigames"
		mathGame.text = "Wiskunde race"
		mazeGame.text = "Het labyrinth"
		print("Language is english")
	elif config.get_value("language", "mode") == "english":
		pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/main_menu.tscn")

func _on_menu_button_pressed():
	if !pauseMenu.visible:
		pauseMenu.set_visible(true)
	else:
		pauseMenu.set_visible(false)


func _on_math_game_pressed():
	get_tree().change_scene_to_file("res://src/appdata/introduction.tscn")


func _on_maze_game_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_intro.tscn")


func _on_canvas_layer_visibility_changed():
	if pauseMenu.is_visible():
		pass
	else:
		get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")
