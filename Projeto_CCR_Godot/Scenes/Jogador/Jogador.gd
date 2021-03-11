extends KinematicBody2D

var dir : Vector2
var dir_buffer : Vector2
var pointing : Vector2
var light_cone_state = 0 setget set_cone_state
export(Color) var  Lamp_one
export(Color) var  Lamp_two
export(Color) var  Lamp_tree

func set_cone_state(valor):
	
	match valor:
		0:
			light_cone_color = Lamp_one
			light_cone_state = valor
			$Jogador_anim/DirectionalLight/DirectionalHardLight.set_item_cull_mask(1)
			$Jogador_anim/HardLight.texture_scale = 1
			$Jogador_anim/SoftLight.texture_scale = 1
		1:
			light_cone_color = Lamp_two
			light_cone_state = valor
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(9)
			$Jogador_anim/HardLight.texture_scale = 1
			$Jogador_anim/SoftLight.texture_scale = 1
		2:
			light_cone_color = Lamp_tree
			light_cone_state = valor
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(5)
			$Jogador_anim/HardLight.texture_scale = 1
			$Jogador_anim/SoftLight.texture_scale = 1
		3:
			light_cone_color = Lamp_one
			light_cone_state = 0
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(1)
			$Jogador_anim/HardLight.texture_scale = 1
			$Jogador_anim/SoftLight.texture_scale = 1
	
	

var light_cone_color : Color = Color(1,1,1,1)


func _ready():
	
	$Jogador_anim/Move.show()
	$Jogador_anim/Move/Move.play()
	$Jogador_anim/Death.hide()
	


func _input(_event):
	
	dir.x =  (int(Input.is_action_pressed("Direita")) -int(Input.is_action_pressed("Esquerda")))
	dir.y =  (int(Input.is_action_pressed("Descer")) - int(Input.is_action_pressed("Subir")))
	
	if dir.x != 0:
		dir_buffer.x = dir.x
		
	

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("Trocar_Luz"):
		set_cone_state(light_cone_state + 1)
		
	
	pointing = get_global_mouse_position()
	
	# warning-ignore:return_value_discarded
	if not CCR_Global.cutscene:
		move_and_slide(dir*Vector2(100,50), Vector2(0,-1))
		
		if dir_buffer.x < 0:
			
			$Jogador_anim.scale.x = 1
		else:
			$Jogador_anim.scale.x = -1
		
	
	
	$DirectionalLight.global_position = $Jogador_anim/font_cone_light.global_position
	$DirectionalLight.rotation = (pointing - global_position).angle()
	
	$DirectionalLight/DirectionalHardLight.color = light_cone_color
	$DirectionalLight/DirectionalSoftLight.color = light_cone_color
	
	

func _on_Morte_area_shape_entered(area_id, area, area_shape, self_shape):
	CCR_Global.cutscene = true
	$Jogador_anim/Move.hide()
	$Jogador_anim/Death.show()
	$Jogador_anim/Death/Death.play("Death")
	
	
