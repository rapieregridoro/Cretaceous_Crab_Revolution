extends KinematicBody2D

var dir : Vector2
var dir_buffer : Vector2
var pointing : Vector2


func _ready():
	
	pass 


func _input(_event):
	
	dir.x =  (int(Input.is_action_pressed("Direita")) -int(Input.is_action_pressed("Esquerda")))
	dir.y =  (int(Input.is_action_pressed("Descer")) - int(Input.is_action_pressed("Subir")))
	
	if dir.x != 0:
		dir_buffer.x = dir.x
		
	
	pointing = get_global_mouse_position()
	

func _physics_process(_delta):
	
	
	
	# warning-ignore:return_value_discarded
	move_and_slide(dir*Vector2(100,50), Vector2(0,-1))
	
	if dir_buffer.x < 0:
		
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	$DirectionalLight.rotation = (pointing - global_position).angle()
	
	

