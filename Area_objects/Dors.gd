extends Node2D
var once=false
func _on_Fight_start_trigger_body_entered(body):
	if body.name=="Player"&&!once:
		$Dor_animation.play("Dors_animation")
		once=true


func _on_Game_fight_end():
	$Dor_animation.play_backwards("Dors_animation")
