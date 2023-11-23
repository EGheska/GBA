extends CanvasLayer

@onready var SettingsMenu = $SettingsMenu
@onready var GameSelection = $GameSelection

@onready var MarginContainers = $Menu/MarginContainer/VBoxContainer/MarginBetween2

@onready var StartButton = $Menu/MarginContainer/VBoxContainer/StartButton
@onready var SettingButton = $Menu/MarginContainer/VBoxContainer/SettingsButton
@onready var QuitButton = $Menu/MarginContainer/VBoxContainer/QuitButton




func _ready():
	pass


func _on_start_button_pressed():
	if !GameSelection.is_visible():
		GameSelection.set_visible(true);
		StartButton.set_pressed_no_signal(false)
	


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
	QuitButton.set_pressed_no_signal(false)
