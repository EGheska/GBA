class_name solver extends Popup

@onready var textLabel = $Control/Label

const firstCode = "2163"

var solved = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\n You can find a key for decipher the code in the message left for you.\n Use that to so")


func _on_line_edit_text_submitted(new_text):
	if new_text == firstCode:
		var t = Timer.new()
		textLabel.set_text("Congratulations!\n You have solved the first code!")
		solved = true
		print(solved)
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		await t.timeout
		print("Timeout")
		self.set_visible(false)
	else:
		textLabel.set_text("The code does not match.\n Maybe, try one more time?")



