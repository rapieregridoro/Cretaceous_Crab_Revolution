extends KinematicBody2D

var dir : Vector2
var dir_buffer : Vector2
var acel : Vector2

func _ready():
	
	pass 


func _input(_event):
	
	dir.x =  (int(Input.is_action_pressed("ui_right")) -int(Input.is_action_pressed("ui_left")))
	dir.y =  (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
	
	if dir.x != 0:
		dir_buffer.x = dir.x
		
	

func _physics_process(_delta):
	
	
	if dir.x != 0:
		
		acel.x = 100 
		
		pass
	
	
	# warning-ignore:return_value_discarded
	move_and_slide(dir*Vector2(100,50), Vector2(0,-1))
	
	if dir_buffer.x < 0:
		
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	

