extends Area2D

# this is a useless feature since I didnt have the time but it ups your score everytime you collect a carrot
@onready var game_manager = %gamemanager
func _on_body_entered(body):
	game_manager.add_point()
	queue_free()
