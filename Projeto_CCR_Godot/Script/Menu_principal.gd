extends Control

export(PackedScene) var Jogar

func _ready():
	
	pass 


func _process(delta):
	
	pass


func _on_Jogar_pressed():
	get_tree().change_scene_to(Jogar)
	
