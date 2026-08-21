extends Node2D

var button_type = null
@onready var test = $Button/test

func _ready():
	$transition/fade.play("fade_out")

# back
func _on_back_pressed():
	button_type = "back"
	$transition.show()
	$transition/fade_timer.start()
	$transition/fade.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))

func _on_button_pressed() -> void:
	test.play()
