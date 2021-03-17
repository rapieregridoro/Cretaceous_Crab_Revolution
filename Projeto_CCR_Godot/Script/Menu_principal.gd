extends Control

export(PackedScene) var Jogar
var versao = "Ver 0.1"

func _ready():
	$Versao.text = versao
	pass 


func _process(delta):
	
	pass


func _on_Jogar_pressed():
	get_tree().change_scene_to(Jogar)
	


func _on_Quit_pressed():
	get_tree().quit()


func _on_PT_pressed():
	TranslationServer.set_locale("pt_BR")
	print(tr('Botao_jogar'))


func _on_EN_pressed():
	TranslationServer.set_locale("en_US")
	print(tr('Botao_jogar'))
