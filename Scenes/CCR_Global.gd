extends Node

const Ziloneo = "Ziloneo"
const Froggson = "Froggson"
const Valerie = "Valerie"

var conversa = "nenhuma"
var retrato = "Ninguem"

func _ready():
	TranslationServer.set_locale("pt_BR")
	

func _process(delta):
	pass


func talk(quem, oque, qual):
	
	$HUD_inferior/ColorRect/Valerie.visible = quem == "Valerie"
	$HUD_inferior/ColorRect/Froggson.visible = quem == "Froggson"
	$HUD_inferior/ColorRect/Ziloneo.visible = quem == "Ziloneo"
	
	$HUD_inferior/ColorRect/Fala.text = tr(String(quem + "_" + oque + "_" + qual))
	
	

func conversando(assunto, fala):
	
	match assunto:
		"intro":
			if fala <= 13:
				match fala:
					0, 2, 4, 6, 8, 10, 12:
						retrato = Ziloneo
					1, 3, 5, 7, 9, 11, 13:
						retrato = Froggson
					
				
			
		"nave":
			if fala <= 10:
				match fala:
					0, 2, 3, 5, 7, 8, 10:
						retrato = Valerie
					1, 4, 6:
						retrato = Ziloneo
					9:
						retrato = Froggson
					
				
			
		"submarino":
			if fala <= 3:
				match fala:
					1, 3:
						retrato = Valerie
					2:
						retrato = Ziloneo
					0:
						retrato = Froggson
					
				
			
		"porta_um":
			if fala <= 4:
				match fala:
					0, 2:
						retrato = Valerie
					3:
						retrato = Ziloneo
					1:
						retrato = Froggson
					
				
			
		"chave":
			if fala <= 4:
				match fala:
					1, 3:
						retrato = Valerie
					2:
						retrato = Ziloneo
					0:
						retrato = Froggson
					
				
			
		"porta_um_aberta":
			if fala <= 1:
				match fala:
					0:
						retrato = Valerie
					1:
						retrato = Ziloneo
					
				
		"morte":
			if fala <= 5:
				match fala:
					0, 1, 2:
						retrato = Valerie
					5:
						retrato = Ziloneo
					3, 4:
						retrato = Froggson
					
				
			
		
	
	talk(retrato, assunto, String(fala))
	

