extends CanvasLayer

@onready var SettingsMenu = $SettingsMenu


func _on_settings_button_toggled(button_pressed):
	SettingsMenu.popup_centered()
