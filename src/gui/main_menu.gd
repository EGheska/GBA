extends CanvasLayer

@onready var SettingsMenu = $SettingsMenu
@onready var GameSelection = $GameSelection

@onready var MarginContainers = $Menu/MarginContainer/VBoxContainer/MarginBetween2




func _ready():
	pass


func _on_start_button_pressed():
	if !GameSelection.is_visible():
		GameSelection.set_visible(true);
	


func _on_settings_button_pressed():
	if SettingsMenu.is_visible():
		SettingsMenu.set_visible(false)
	else:
		SettingsMenu.set_visible(true)
		SettingsMenu.popup_centered()


func _on_quit_button_pressed():
	get_tree().quit() 
