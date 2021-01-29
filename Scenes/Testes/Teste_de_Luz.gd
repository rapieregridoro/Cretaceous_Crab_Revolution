extends Node

var mova = Vector2(0,0)

func _ready():
	
	pass # Replace with function body.


func _process(delta):
	
	mova.x =  (int(Input.is_action_pressed("ui_right")) -int(Input.is_action_pressed("ui_left")))
	mova.y =  (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
	
	
	$Control/LightOccluder2D.position = $Control/LightOccluder2D.position.move_toward($Control/LightOccluder2D.position + mova,1)
	
