extends Node2D

var button_type = null

func _ready():
	$transition/fade.play("fade_out")

# back
func _on_back_pressed():
	button_type = "back"
	$transition.show()
	$transition/fade_timer.start()
	$transition/fade.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
