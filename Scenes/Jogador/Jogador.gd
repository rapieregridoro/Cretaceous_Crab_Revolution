extends KinematicBody2D

var dir : Vector2
var dir_buffer : Vector2
var pointing : Vector2
var light_cone_state = 0 setget set_cone_state

func set_cone_state(valor):
	
	match valor:
		0:
			light_cone_color = Color(1,1,1,1)
			light_cone_state = valor
		1:
			light_cone_color = Color(0.898438, 0, 1,1)
			light_cone_state = valor
		2:
			light_cone_color = Color(1, 0, 0, 1)
			light_cone_state = valor
		3:
			light_cone_color = Color(1,1,1,1)
			light_cone_state = 0

var light_cone_color : Color = Color(1,1,1,1)

func _ready():
	
	pass 


func _input(_event):
	
	dir.x =  (int(Input.is_action_pressed("Direita")) -int(Input.is_action_pressed("Esquerda")))
	dir.y =  (int(Input.is_action_pressed("Descer")) - int(Input.is_action_pressed("Subir")))
	
	if dir.x != 0:
		dir_buffer.x = dir.x
		
	
	pointing = get_global_mouse_position()
	
	if Input.is_action_just_pressed("Trocar_Luz"):
		set_cone_state(light_cone_state + 1)
		print(light_cone_state)
		pass
	

func _physics_process(_delta):
	
	
	
	# warning-ignore:return_value_discarded
	move_and_slide(dir*Vector2(100,50), Vector2(0,-1))
	
	if dir_buffer.x < 0:
		
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	$DirectionalLight.rotation = (pointing - global_position).angle()
	
	$DirectionalLight/DirectionalHardLight.color = light_cone_color
	$DirectionalLight/DirectionalSoftLight.color = light_cone_color
	
	
	
	
	
	
