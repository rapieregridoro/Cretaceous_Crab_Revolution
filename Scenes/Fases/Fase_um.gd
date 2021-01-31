extends Node
var conversando = false
var conversa_intro = 0

func _ready():
	
	CCR_Global.get_node("GGJ21_-_Trilha_Submarino").play()
	


func _process(delta):
	
	if conversando and Input.is_action_just_pressed("Interagir"):
		intro_conversation()
		
	


func _on_Area2D_body_entered(body):
	
	intro_conversation()
	
	


func intro_conversation():
	if conversa_intro <= 13:
		CCR_Global.cutscene = true
		conversando = true
		CCR_Global.conversando("intro", conversa_intro)
		conversa_intro += 1
	elif conversa_intro > 13:
		conversando = false
		CCR_Global.cutscene = false
	
