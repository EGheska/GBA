extends CanvasLayer

@onready var SettingsMenu = $SettingsMenu
@onready var GameSelection = $GameSelection

@onready var StartButton = $Menu/MarginContainer/VBoxContainer/StartButton
@onready var SettingButton = $Menu/MarginContainer/HBoxContainer/SettingsButton
@onready var QuitButton = $Menu/MarginContainer/HBoxContainer/QuitButton
@onready var settings = $SettingsMenu
var config = ConfigFile.new()


func _ready():
	config.load("res://settings.cfg")
	if config.get_value("language", "mode") == "dutch":
		SettingButton.text = "Instellingen"
		QuitButton.text = "Spel verlaten"
		print("Language is english")
	elif config.get_value("language", "mode") == "english":
		SettingButton.text = "Settings"
		QuitButton.text = "Quit the game"

func _on_start_button_pressed():
	if !GameSelection.is_visible():
		GameSelection.set_visible(true)
		#StartButton.set_pressed_no_signal(false)

func _on_settings_button_pressed():
	if SettingsMenu.is_visible():
		SettingsMenu.set_visible(false)
		SettingButton.set_pressed_no_signal(false)
	else:
		SettingsMenu.set_visible(true)
		SettingButton.set_pressed_no_signal(false)
		SettingsMenu.popup_centered()

func _on_quit_button_pressed():
	get_tree().quit() 
	#QuitButton.set_pressed_no_signal(false)


func _on_settings_menu_visibility_changed():
	if settings.is_visible():
		pass
	else:
		get_tree().change_scene_to_file("res://src/gui/main_menu.tscn")
