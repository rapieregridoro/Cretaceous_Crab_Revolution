extends Node

const Ziloneo = "Ziloneo"
const Froggson = "Froggson"
const Valerie = "Valerie"
const Crabocitus = "Crabocitus"

var conversa = "nenhuma"
var retrato = "Ninguem"

var chave = [false, false, false, false, false]
var cutscene = false

func _ready():
	TranslationServer.set_locale("pt_BR")
	$HUD_inferior/ColorRect.hide()

func _process(delta):
	
	pass


func talk(quem, oque, qual, fim = false):
	
	$HUD_inferior/ColorRect/Valerie.visible = quem == "Valerie"
	$HUD_inferior/ColorRect/Froggson.visible = quem == "Froggson"
	$HUD_inferior/ColorRect/Ziloneo.visible = quem == "Ziloneo"
	print((String(quem + "_" + oque + "_" + String(qual))))
	$HUD_inferior/ColorRect/Fala.text = tr(String(quem + "_" + oque + "_" + String(qual)))
	
	if fim:
		$HUD_inferior/ColorRect/Valerie.visible = false
		$HUD_inferior/ColorRect/Froggson.visible = false
		$HUD_inferior/ColorRect/Ziloneo.visible = false
		$HUD_inferior/ColorRect/Fala.text = " "

func conversando(assunto, fala):
	var final =  false
	
	match assunto:
		"intro":
			if fala <= 13:
				match fala:
					0, 2, 4, 6, 8, 10, 12:
						retrato = Ziloneo
					1, 3, 5, 7, 9, 11, 13:
						retrato = Froggson
			else:
				final = true
			
		"nave":
			if fala <= 10:
				match fala:
					0, 2, 3, 5, 7, 8, 10:
						retrato = Valerie
					1, 4, 6:
						retrato = Ziloneo
					9:
						retrato = Froggson
			else:
				final = true
			
		"submarino":
			if fala <= 3:
				match fala:
					1, 3:
						retrato = Valerie
					2:
						retrato = Ziloneo
					0:
						retrato = Froggson
			else:
				final = true
				
			
		"porta_um":
			if fala <= 4:
				match fala:
					0, 2, 4:
						retrato = Valerie
					3:
						retrato = Ziloneo
					1:
						retrato = Froggson
			else:
				final = true
			
		"chave":
			if fala <= 4:
				match fala:
					3:
						retrato = Valerie
					1:
						retrato = Ziloneo
					0, 2, 4:
						retrato = Froggson
			
			
		"porta_um_aberta":
			if fala <= 1:
				match fala:
					0:
						retrato = Valerie
					1:
						retrato = Ziloneo
			else:
				final = true
				
		"morte":
			if fala <= 5:
				match fala:
					0, 1, 2:
						retrato = Valerie
					5:
						retrato = Ziloneo
					3, 4:
						retrato = Froggson
			else:
				final = true
			
		"lab":
			if fala <= 5:
				match fala:
					0, 1, 3, 5:
						retrato = Froggson
					2, 4:
						retrato = Valerie
			else:
				final = true
			
		"final":
			if fala <= 14:
				match fala:
					0, 4, 6, 12:
						retrato = Ziloneo
					1, 7, 10:
						retrato = Valerie
					2, 5, 13:
						retrato = Froggson
					3, 8, 9, 11, 14:
						retrato = Crabocitus
			else:
				final = true
	
	talk(retrato, assunto, String(fala), final)
	

