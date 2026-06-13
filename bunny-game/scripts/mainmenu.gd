extends Node2D

var button_type = null

func _on_start_pressed():
	button_type = "start"
	$transition.show()
	$transition/fade_timer.start()
	$transition/fade.play("fade_in")

func _on_options_pressed():
	button_type = "options"
	$transition.show()
	$transition/fade_timer.start()
	$transition/fade.play("fade_in")
	
func _on_quit_pressed():
	get_tree().quit()

func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	elif button_type == "options":
		get_tree().change_scene_to_file("res://scenes/settings.tscn")
