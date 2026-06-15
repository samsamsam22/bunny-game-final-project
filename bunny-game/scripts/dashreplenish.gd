extends Area2D

#sets dash to true when collided with then resets in a few secs
var active: bool = true

func _on_body_entered(body: Node2D) -> void:
	if active:
		if body.can_dash:
			return
		
		body.can_dash = true
		active = false
		
		$AnimatedSprite2D.play("timer")
		$replenishtimer.start()

func _on_replenishtimer_timeout() -> void:
	active = true
	$AnimatedSprite2D.play("default")
	
