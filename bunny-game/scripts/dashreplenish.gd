extends Area2D

var active: bool = true

func _on_body_entered(body: Node2D) -> void:
	if active:
		if body.can_dash:
			return
		
		body.can_dash = true
		active = false
		
		$timeranim.play("timer")
		$replenishtimer.start()

func _on_replenishtimer_timeout() -> void:
	active = true
	$timeranim.play("RESET")
	
