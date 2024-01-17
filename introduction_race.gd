extends CanvasLayer



var config = ConfigFile.new()

func write_intro_labels():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		$"Control/ColorRect/Gameplay Explanation".text = "De auto's van jouw en je tegenstander blijven consistent bewegen, beantwoord de wiskunde vragen correct om een snelheidsverhoging te krijgen en je tegenstander in te halen!"
		$"Control/ColorRect/Title Label".text = "Gameplay-introductie"
		$"Control/ColorRect/Button Introduction".text = "Gebruik je muis om de correct antwoorden te drukken in de balk die beneden te zien is, de toetsenbord knoppen die te zien zijn in de knoppen kunnen ook gebruikt worden"
		$Control/ColorRect/Quit_Button.text = "Ik begrijp het, ga door naar het spel"
	elif(config.get_value("language", "mode") == "english"):
		$"Control/ColorRect/Gameplay Explanation".text = "You and your opponents cars will move consistently, Answer the math questions correctly to get a speedboost and overtake your opponent!"
		$"Control/ColorRect/Title Label".text = "Gameplay Introduction:"
		$"Control/ColorRect/Button Introduction".text = "Use your mouse to press the correct answer in the bar you can see below, Keyboard buttons shown in the buttons can also be used"
		$Control/ColorRect/Quit_Button.text = "I understand, continue to game"

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/race_level_selection.tscn")

func _on_tree_entered():
	config.load("res://settings.cfg")
	write_intro_labels()
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")
