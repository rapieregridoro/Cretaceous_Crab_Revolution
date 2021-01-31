extends Node2D

export var ID = 0
var closed = true

func _ready():
	
	pass 

func _process(delta):
	
	
	pass

func open_the_door():
	
	$Sprite/AnimationPlayer.play("Abrir")
	$StaticBody2D/CollisionShape2D.disabled = true
	

func _on_Area2D_body_entered(body):
	if CCR_Global.chave[ID] == true and closed:
		open_the_door()
		closed = false
	

func _on_AnimationPlayer_animation_finished(anim_name):
	$StaticBody2D/CollisionShape2D.disabled = true
	
