extends Control
var skoka=100
var skoka_net=50



func _ready():
	skoka=JSON.new().stringify(skoka)
	skoka_net=JSON.new().stringify(skoka_net)
	$Label.text=skoka_net+"/"+skoka
#	$Label.add_text=skoka_net
