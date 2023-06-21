extends Node2D

signal Fight_start
signal fight_end

#onready var nav_2d:Navigation2D=$Navigation//eto umnoje peredvizenije dla odinochnih vragov
@onready var player:CharacterBody2D=$Player
var where=RectangleShape2D.new()
var Player_starts_fight=false
var rig1=[1,2,3,4,5,6,7,8,9,10,11]
var rig2=[2,2,1,1,3,0,3,0,4,5,6]
var pos=0
var gods_gun_is_in_game=false
var enemy_is_dead=false
var all_enemy_is_dead=0
var all_enemy_count=4
func _ready():
	#$HUD/Interface/Enemy_name.hide()
	#$HUD/Interface/HP_Bar_for_enemy.hide()
	set_camera_limits()	
	
func _process(delta):
	#if $Player&&!enemy_is_dead:
	#	var new_path=nav_2d.get_simple_path(player.global_position, enemy.global_position)
	#	enemy.path=new_path//eto umnoje peredvizenije dla odinochnih vragov
	if Player_starts_fight:
		emit_signal('Fight_start')
		#$HUD/Interface/Enemy_name.visible=true
		#$HUD/Interface/HP_Bar_for_enemy.visible=true
	#else:		
	#	$HUD/Interface/Enemy_name.visible=false
	#	$HUD/Interface/HP_Bar_for_enemy.visible=false
	if !gods_gun_is_in_game:
		if Input.is_action_just_pressed("click"):
			pos=0
			rig1.is_empty()
		if Input.is_action_just_pressed("right"):
			rig1[pos]=2
			pos+=1
		if Input.is_action_just_pressed("left"):
			rig1[pos]=1
			pos+=1
		if Input.is_action_just_pressed("down"):
			rig1[pos]=0
			pos+=1
		if Input.is_action_just_pressed("up"):
			rig1[pos]=3
			pos+=1
		if Input.is_action_just_pressed("use"):
			rig1[pos]=4
			pos+=1
		if Input.is_action_just_pressed("fast_gun_change"):
			rig1[pos]=5
			pos+=1
		if Input.is_action_just_pressed("flip"):
			rig1[pos]=6
			pos+=1
		if rig1==rig2:
			gods_gun_is_in_game=true
			$Gods_gun.visible=true
			$Gods_gun.global_position=$Player.global_position
			$Player.max_health=1000
			$Player.health=1000
		elif pos==11:
			pos=0
			rig1.is_empty()
	
func set_camera_limits():
	var map_limits= $Navigation/Ground.get_used_rect()
	var map_cellsize=$Navigation/Ground.cell_size
	$Player/Camera2D.limit_left=map_limits.position.x*map_cellsize.x
	$Player/Camera2D.limit_right=map_limits.end.x*map_cellsize.x
	$Player/Camera2D.limit_top=map_limits.position.y*map_cellsize.y
	$Player/Camera2D.limit_bottom=map_limits.end.y*map_cellsize.y
	
func _on_shoot(bullet,_position,_direction):
	var b = bullet.instantiate()
	add_child(b)
	b.start(Callable(_position, _direction))
	





func _on_Area2D_body_entered(body):
	if body.name=="Player" and !Player_starts_fight&&!enemy_is_dead:
		Player_starts_fight=true


func _on_QuitButton_pressed():
	get_tree().quit()
	



func _on_Enemy_dead():
	all_enemy_is_dead+=1
	if all_enemy_is_dead==all_enemy_count:
		enemy_is_dead=true
		Player_starts_fight=false	
		emit_signal('fight_end')
	


func _on_Gun_area_body_entered(body):
	$Use.visible=true
	$Use.global_position=body.global_position


func _on_Gun_area_body_exited(body):
	$Use.visible=false


func _on_Scene_change_trigger_body_entered(body):
	if body.name=="Player":
		get_tree().change_scene_to_file("res://2nd_level/Main2.tscn")


