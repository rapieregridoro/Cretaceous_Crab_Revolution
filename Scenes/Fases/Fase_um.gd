extends Node

var conversa_intro = 0

func _ready():
	
	CCR_Global.get_node("GGJ21_-_Trilha_Submarino").play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if conversa_intro <= 13:
		CCR_Global.conversando("intro", conversa_intro)
		conversa_intro += 1
	
