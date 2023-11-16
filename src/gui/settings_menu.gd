extends Popup

@onready var settings_menu = $SettingsMenu

# General Settings
@onready var display_options = $SettingsTab/General/MarginContainer/GeneralSettings/DisplayModeButton
@onready var sound_options = $SettingsTab/General/MarginContainer/GeneralSettings/CheckButton
# Gameplay Settings
@onready var difficulty_mode = $SettingsTab/Gameplay/MarginContainer/GameplaySettings/DifficultyModeButton
@onready var help_button = $SettingsTab/Gameplay/MarginContainer/GameplaySettings/HelpCheckButton
# Account Settings
@onready var skills_menu = $SettingsTab/Account/MarginContainer/GeneralSettings/SkillsmenuButton
@onready var PopUp = $"."

func _ready():
	pass
	

func _on_display_mode_button_item_selected(index):
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		PopUp.popup_centered()	
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		PopUp.popup_centered()
		


func _on_check_button_toggled(button_pressed):
	if !button_pressed:
		AudioServer.set_bus_volume_db(0, -72)
		print("Volume set to 0")
	else:
		AudioServer.set_bus_volume_db(0, 0)
		print("Volume set to 100")


func _on_difficulty_mode_button_item_selected(index):
	pass # Replace with function body.


func _on_skillsmenu_button_toggled(button_pressed):
	pass # Replace with function body.
