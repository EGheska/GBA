extends Popup

# General Settings
@onready var display_options = $SettingsTab/General/MarginContainer/GeneralSettings/DisplayModeButton
@onready var sound_options = $SettingsTab/General/MarginContainer/GeneralSettings/CheckButton
# Advanced Settings
@onready var Dyslexia = $SettingsTab/Advanced/MarginContainer/AdvanvedSettings/DyslexiaButton

# Account Settings
@onready var skills_menu = $SettingsTab/Account/MarginContainer/GeneralSettings/SkillsmenuButton
@onready var PopUp = $"."

@onready var config = ConfigFile.new()


func _ready():
	costyl()


func _on_visibility_changed():
	costyl()


func costyl():
	if config.load("res://settings.cfg") != OK:
		print("Failed to read")
		config.set_value("display", "mode", "window")
		print("display mode setted")
		config.set_value("color", "mode", "normal")
		print(config.get_value("color", "mode"))

	if config.get_value("display", "mode") == "window":
		display_options.select(1)
		print("display mode window")
	else:
		display_options.select(0)
		print("display mode full")
		
	if config.get_value("color", "mode") == "blind":
		Dyslexia.set("button_pressed", true)
	elif config.get_value("color", "mode") == "normal":
		Dyslexia.set("button_pressed", false)
	config.save("res://settings.cfg")
	


func _on_display_mode_button_item_selected(index):
	config.load("res://settings.cfg")
	print(config.get_value("display", "mode"))
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		PopUp.popup_centered()
		config.set_value("display", "mode", "fullscreen")
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		PopUp.popup_centered()
		config.set_value("display", "mode", "window")
	#print(config.get_value("display", "mode"))
	#print(display_options.selected)
	config.save("res://settings.cfg")


func _on_sound_button_toggled(button_pressed):
	if !button_pressed:
		AudioServer.set_bus_volume_db(0, -72)
		print("Volume set to 0")
	else:
		AudioServer.set_bus_volume_db(0, 0)
		print("Volume set to 100")


func _on_dyslexia_button_toggled(button_pressed):
	config.load("res://settings.cfg")
	if button_pressed:
		config.set_value("color", "mode", "blind")
		print("color mode blind")
		print(config.get_value("color", "mode"))
	elif !button_pressed:
		config.set_value("color", "mode", "normal")	
		print(config.get_value("color", "mode"))
	config.save("res://settings.cfg")
