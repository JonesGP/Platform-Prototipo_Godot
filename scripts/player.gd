extends KinematicBody2D

var grav = 800
var speed = 200
var dir = Vector2()
var jump = 1300

func _ready():
	pass
	
func _physics_process(delta):
	
	
	#print(grav, speed, dir, jump)
	dir.x = 0
	#print(get_slide_count())
	#print(get_last_slide_collision())
	if not is_on_floor(): #se não estinver no chão façã o calculo de gravidade
		dir.y += grav * delta # faz com que y sempre aumente de acordo com grav e delta fazendo o feito de gravidade
	else:
		dir.y = grav	
		
	if Input.is_action_pressed("ui_right"): # se o botão right for apertando a direção x recede a velocidade
		dir.x = speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"): # se o botão left for pressionado a direção x recebe -velocidade
		dir.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		dir.x = 0
		$AnimatedSprite.play("idle")
		
	if is_on_ceiling(): #quando colidir com um teto
		dir.y = grav * delta # a posição y ser igual a grav * delta resumindo faz com que assim que colidir com o teto ele cacelara o pulo
		
		pass
	if is_on_floor() and Input.is_action_just_pressed("ui_select"): # se estinver no chão e a tecla select(espaço) for apentada
		dir.y -= jump #direção y tira o valor de jump fazendo o efeito de pulo
	move_and_slide(dir, Vector2(0, -1))
	
	
func jump1():
	dir.y -= 500
		
		
	







