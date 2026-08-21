extends Node2D

func _ready():
	Gamemanager.reset_score()
	$transition/fade.play("fade_out")
