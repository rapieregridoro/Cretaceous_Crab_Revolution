extends Node2D

export var ID = 0
var closed = true
var conversa_porta_um = 0
var conversando = "nenhuma"
func _ready():
	
	pass 

func _process(delta):
	if conversando == "porta_um" and Input.is_action_just_pressed("Interagir"):
		porta_um_conversation()
	
	pass

func open_the_door():
	
	$Sprite/AnimationPlayer.play("Abrir")
	$StaticBody2D/CollisionShape2D.disabled = true
	$Porta_Abrindo.play()
	

func _on_Area2D_body_entered(body):
	if CCR_Global.chave[0] == false:
		porta_um_conversation()
	if CCR_Global.chave[ID] == true and closed:
		open_the_door()
		closed = false
	

func _on_AnimationPlayer_animation_finished(anim_name):
	$StaticBody2D/CollisionShape2D.disabled = true
	
func porta_um_conversation():
	
	if conversa_porta_um <= 5:
		
		conversando = "porta_um"
		
		CCR_Global.conversando("porta_um", conversa_porta_um)
		conversa_porta_um += 1
		
	elif conversa_porta_um > 4:
		conversando = "nenhuma"
		
