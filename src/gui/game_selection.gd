extends CanvasLayer

@onready var ThisTile = $"."
@onready var SettingsMenu = $"SettingsMenu"

@onready var BackButton = $GameSelection/MarginContainer/VBoxContainer/BackButton
@onready var SettingButton = $GameSelection/MarginContainer/VBoxContainer/SettingsButton

func _ready():
	pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/main_menu.tscn")


func _on_settings_button_pressed():
	if !SettingsMenu.is_visible():
		SettingsMenu.set_visible(true)
		SettingsMenu.popup_centered()
		SettingButton.set_pressed_no_signal(false)
	else:
		SettingsMenu.set_visible(false)
		SettingButton.set_pressed_no_signal(false)


func _on_game_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_intro.tscn")


func _on_game_button_2_pressed():
	get_tree().change_scene_to_file("res://src/appdata/introduction.tscn")
