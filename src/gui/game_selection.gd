extends CanvasLayer

@onready var ThisTile = $"."
@onready var SettingsMenu = $"SettingsMenu"


func _on_back_button_pressed():
	if ThisTile.is_visible():
		ThisTile.set_visible(false)


func _on_settings_button_pressed():
	if !SettingsMenu.is_visible():
		SettingsMenu.set_visible(true)
		SettingsMenu.popup_centered()
	else:
		SettingsMenu.set_visible(false)
		
