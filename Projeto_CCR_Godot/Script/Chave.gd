extends Node2D
export var ID = 0
var pegavel = false
var mouse_dentro = false
var conversa_chave = 0
var fim = false
var pego = false
var botao_apertado = false


func _ready():
	pass 

func _process(delta):
	
	if pego and Input.is_action_just_pressed("Interagir"):
		if botao_apertado:
			botao_apertado = false
		else:
			chave_conversation()
			queue_free() 
		
	

func _on_Ativando_body_entered(body):
	pegavel = true
	

func _on_Ativando_body_exited(body):
	pegavel = false
	

func _on_Button_pressed():
	if pegavel and Input.is_action_just_pressed("Interagir"):
		CCR_Global.chave[ID] = true
		$AudioStreamPlayer2D.play()
		chave_conversation()
		pego = true
		visible = false
		botao_apertado = true
	

func chave_conversation():
	if !fim:
		conversa_chave = randi() % 5
		CCR_Global.conversando("chave", conversa_chave)
		fim = true
	else:
		CCR_Global.talk("nada", "nada", 0, true)
	
