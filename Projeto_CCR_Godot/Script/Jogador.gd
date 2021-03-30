extends KinematicBody2D

#Submarino controlado pelo Jogador

export var has_white_lamp = true
export(Color) var  Lamp_white
export var has_red_lamp = true
export(Color) var  Lamp_red
export var has_violet_lamp = true
export(Color) var  Lamp_violet


var dir : Vector2
var dir_buffer : Vector2

var pointing : Vector2
var light_color : Color = Lamp_white

var has_radial_lens = true
var has_lens = true
var has_lazer = true



var light_state = 0 setget set_light_state
func set_light_state(valor):
	
	match valor:
		
		0:
			light_color = Lamp_white
			light_state = valor
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(1)
			
		1:
			light_color = Lamp_red
			light_state = valor
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(9)
			
		2:
			light_color = Lamp_violet
			light_state = valor
			$DirectionalLight/DirectionalHardLight.set_item_cull_mask(5)
			
		
	



func _ready():
	
	$Jogador_anim/Move.show()
	$Jogador_anim/Move/Move.play()
	$Jogador_anim/Death.hide()
	

func _physics_process(_delta):
	
	#pegar mouse 
	pointing = get_global_mouse_position()
	
	#input direções e pegar ultima direção
	dir.x =  (int(Input.is_action_pressed("Direita")) -int(Input.is_action_pressed("Esquerda")))
	dir.y =  (int(Input.is_action_pressed("Descer")) - int(Input.is_action_pressed("Subir")))
	if dir.x != 0:
		dir_buffer.x = dir.x
	
	#movimento se não estiver em cutscene
	if not CCR_Global.cutscene:
		movement()
		submarino_anim()
	
	#Troca a luz ao apertar a ação
	if Input.is_action_just_pressed("Trocar_Luz"):
		change_lamp()
		
	
	#luz segue o mouse
	directional_light()
	

#Funções
func change_lamp():
	#mudança do estado da luz
	var mudou = false
	var lamps = [has_white_lamp,has_red_lamp, has_violet_lamp]
	var new_lamp = light_state + 1 if light_state < 2 else 0
	if has_white_lamp or has_red_lamp or has_violet_lamp:
		while !mudou:
			
			if !lamps[new_lamp]:
				new_lamp = new_lamp + 1 if new_lamp < 2 else 0
			else:
				set_light_state(new_lamp)
				mudou = true
			
		

func movement():
	#movimento do submarino
	
	move_and_slide(dir*Vector2(100,50), Vector2(0,-1))
	


func submarino_anim():
	
	#inverter na direção do movimento
	if dir_buffer.x < 0:
		
		$Jogador_anim.scale.x = 1
	else:
		$Jogador_anim.scale.x = -1
	
	

func directional_light():
	#controlar direção da luz com mouse
	
	#alinhar fonte da Luz
	$DirectionalLight.global_position = $Jogador_anim/font_cone_light.global_position
	
	#rotacionar em direção ao mouse
	$DirectionalLight.rotation = (pointing - global_position).angle()
	
	#cor da fonte de luz
	$DirectionalLight/DirectionalHardLight.color = light_color
	$DirectionalLight/DirectionalSoftLight.color = light_color
	
	

#conexões
func _on_Morte_area_shape_entered(area_id, area, area_shape, self_shape):
	
	CCR_Global.cutscene = true
	$Jogador_anim/Move.hide()
	$Jogador_anim/Death.show()
	$Jogador_anim/Death/Death.play("Death")
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://Scenes/Menu/Menu_principal.tscn")
	CCR_Global.cutscene = false

	
	
