extends StaticBody2D

func _on_Fight_start_trigger_body_entered(body):
	$CollisionShape2D.disabled=false
	$Sprite2D.queue_free()


func _on_Enemy_dead():
	$CollisionShape2D.disabled=true
