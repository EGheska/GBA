extends CanvasLayer

@onready var SettingsMenu = $SettingsMenu


func _on_settings_button_toggled(button_pressed):
	if SettingsMenu.is_visible():
		SettingsMenu.set_visible(false)
	else:
		SettingsMenu.set_visible(true)
		SettingsMenu.popup_centered()
	


func _on_quit_button_toggled(button_pressed):
	get_tree().quit() 
