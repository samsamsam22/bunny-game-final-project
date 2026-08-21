extends Area2D

@onready var timer: Timer = $Timer
@onready var death = $death

# calls timer, if timer is up, resets level
func _on_body_entered(body):
	death.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
