extends CanvasLayer

@onready var settings = $SettingsMenu

@onready var pauseLabel = $Control/MarginContainer/VBoxContainer/Label
@onready var menuButton = $Control/MarginContainer/VBoxContainer/MenuButton
@onready var profileButton = $Control/MarginContainer/VBoxContainer/ProfileButton
@onready var gameSelectionButton = $Control/MarginContainer/VBoxContainer/GameSelectionButton
@onready var settingButton = $Control/MarginContainer/VBoxContainer/Options
@onready var quitButton = $Control/MarginContainer/VBoxContainer2/QuitButton



var config = ConfigFile.new()

func _ready():
	config.load("res://settings.cfg")

	if config.get_value("language", "mode") == "dutch":	
		pauseLabel.text = "Pauze"
		menuButton.text = "Hoofdmenu"
		profileButton.text = "Profiel"
		settingButton.text = "Instellingen"
		quitButton.text = "Terug"
	elif config.get_value("language", "mode") == "english":
		pass

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/main_menu.tscn")


func _on_profile_button_pressed():
	pass # Replace with function body.


func _on_game_selection_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_options_pressed():
	if settings.is_visible():
		settings.set_visible(false)
		#SettingButton.set_pressed_no_signal(false)
	else:
		settings.set_visible(true)
		#SettingButton.set_pressed_no_signal(false)
		settings.popup_centered()


func _on_quit_button_pressed():
	self.set_visible(false)

