extends Popup

@onready var settings_menu = $SettingsMenu

# General Settings
@onready var display_options = $SettingsTab/General/MarginContainer/GeneralSettings/DisplayModeButton
@onready var sound_options = $SettingsTab/General/MarginContainer/GeneralSettings/CheckButton
# Advanced Settings
@onready var Dyslexia = $SettingsTab/Advanced/MarginContainer/AdvanvedSettings/DyslexiaButton


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
		display_options.select(index)



func _on_sound_button_toggled(button_pressed):
	if !button_pressed:
		AudioServer.set_bus_volume_db(0, -72)
		print("Volume set to 0")
	else:
		AudioServer.set_bus_volume_db(0, 0)
		print("Volume set to 100")


