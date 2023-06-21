extends Control
@onready var _pc=$Options_menu/Interface/Menu/Buttons/Name_Button/Graphic_button/Graphic_type
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_Graphic_button_pressed():
	_pc.popup(Rect2(0.0,0.0,_pc.size.x,_pc.size.y))


func _on_QuitButton_pressed():
	get_tree().quit()
