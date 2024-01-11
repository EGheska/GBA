extends CanvasLayer

@onready var ThisTile = $"."
@onready var SettingsMenu = $"SettingsMenu"

@onready var BackButton = $GameSelection/MarginContainer/VBoxContainer/BackButton
@onready var SettingButton = $GameSelection/MarginContainer/VBoxContainer/SettingsButton

@onready var pauseMenu = $CanvasLayer

func _ready():
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
