extends CanvasLayer

@onready var ThisTile = $"."


func _on_back_button_pressed():
	if ThisTile.is_visible():
		ThisTile.set_visible(false)
