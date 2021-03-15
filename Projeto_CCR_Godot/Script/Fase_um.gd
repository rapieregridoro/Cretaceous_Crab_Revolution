extends Node
var conversando = "nenhuma"
var conversa_intro = 0
var conversa_submarino = 0
var conversa_porta_um = 0

var conversa_porta_um_aberta = 0
var conversa_morte = 0
var conversa_lab = 0
var conversa_final = 0

func _ready():
	
	CCR_Global.get_node("GGJ21_-_Trilha_Submarino").play()
	CCR_Global.get_node("HUD_inferior/ColorRect").show()


func _process(delta):
	
	if conversando == "submarino" and Input.is_action_just_pressed("Interagir"):
		submarino_conversation()
	if conversando == "porta_um_aberta" and Input.is_action_just_pressed("Interagir"):
		porta_um_aberta_conversation()
	

func _on_Area2D_body_entered(body):
	
	submarino_conversation()
	
	


func intro_conversation():
	
	if conversa_intro <= 13:
		
		conversando = "intro"
		
		CCR_Global.conversando("intro", conversa_intro)
		conversa_intro += 1
		
	elif conversa_intro > 13:
		conversando = "nenhuma"
		
	
	
func submarino_conversation():
	
	if conversa_submarino <= 4:
		
		conversando = "submarino"
		
		CCR_Global.conversando("submarino", conversa_submarino)
		conversa_submarino += 1
		
	elif conversa_submarino > 3:
		conversando = "nenhuma"
		
	
	




		
		
		
func porta_um_aberta_conversation():
	
	if conversa_porta_um_aberta <= 2:
		
		conversando = "porta_um_aberta"
		
		CCR_Global.conversando("porta_um_aberta", conversa_porta_um_aberta)
		conversa_porta_um_aberta += 1
		
	elif conversa_porta_um_aberta > 1:
		conversando = "nenhuma"
		

func morte_conversation():
	
	if conversa_morte <= 5:
		
		conversando = "morte"
		
		CCR_Global.conversando("morte", conversa_morte)
		conversa_morte += 1
		
	elif conversa_morte > 5:
		conversando = "nenhuma"
		
		
func lab_conversation():
	
	if conversa_lab <= 5:
		
		conversando = "lab"
		
		CCR_Global.conversando("lab", conversa_lab)
		conversa_lab += 1
		
	elif conversa_lab > 5:
		conversando = "nenhuma"
		
		
func final_conversation():
	
	if conversa_final <= 14:
		
		conversando = "final"
		
		CCR_Global.conversando("final", conversa_final)
		conversa_final += 1
		
	elif conversa_final > 14:
		conversando = "nenhuma"
		


func _on_porta_um_abrindo_body_entered(body):
	porta_um_aberta_conversation()
	
