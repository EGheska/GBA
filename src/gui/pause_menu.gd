extends CanvasLayer

@onready var settings = $SettingsMenu

func _on_menu_button_pressed():
	pass


func _on_profile_button_pressed():
	pass # Replace with function body.


func _on_game_selection_button_pressed():
	pass # Replace with function body.


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



