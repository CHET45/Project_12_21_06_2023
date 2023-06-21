extends Control
var rearm=false
func _on_Player_amount_change(amount,amount_counter,max_amount):
	if !rearm:
		$Amount_progress.value=amount
	amount_counter=JSON.new().stringify(amount_counter)
	max_amount=JSON.new().stringify(max_amount)
	$Amount_counter_counter.text=amount_counter+"/"+max_amount


func _on_Player_rearm(gun_rearm_timer,can):
	if gun_rearm_timer==3:
		$Amount_progress/AnimationPlayer.play("Amount_animation_for_green")
	elif gun_rearm_timer==6:
		$Amount_progress/AnimationPlayer.play("Amount_animation_for_red")
	elif gun_rearm_timer==4.5:
		$Amount_progress/AnimationPlayer.play("Animation_for_black")
	elif gun_rearm_timer==1:
		$Amount_progress/AnimationPlayer.play("Animation_for_gods_gun")
		

func _on_Player_change_gun():
	$Amount_progress/AnimationPlayer.stop()


func _on_Player_rearm_for_amount(rearm_from_palyer):
	rearm=rearm_from_palyer
