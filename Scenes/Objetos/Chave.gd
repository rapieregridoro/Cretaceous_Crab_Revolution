extends Node2D
export var ID = 0
var pegavel = false
var mouse_dentro = false
func _ready():
	pass # Replace with function body.


func _process(delta):
	if mouse_dentro and pegavel and Input.is_action_just_pressed("Interagir"):
		CCR_Global.chave_um = true
		$AudioStreamPlayer2D.play
	


func _on_Ativando_body_entered(body):
	pegavel = true
	

func _on_Ativando_body_exited(body):
	pegavel = false
	

func _on_Button_pressed():
	print("apertou")
	print(pegavel)
	if pegavel and Input.is_action_just_pressed("Interagir"):
		CCR_Global.chave[ID] = true
		$AudioStreamPlayer2D.play()
		print("ID: ", ID, ", ", CCR_Global.chave[ID])
	
