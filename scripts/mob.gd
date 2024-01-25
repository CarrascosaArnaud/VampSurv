extends CharacterBody2D

var health = 3
var randomGen = randi_range(1,5)
var speed = 750.0

@onready var player = get_node("/root/Game/Player")

func _ready():
	%Bouboule.play_walk()
	if(randomGen == 1):
		$Bouboule.modulate = Color.from_hsv(1,0.8,0.8,0.8)
		$Bouboule.scale = Vector2(1.2, 1.2)
		health = 5
		speed = 500
		
	if(randomGen == 2):
		$Bouboule.modulate = Color(0.5,0.2,1,0.8)
		$Bouboule.scale = Vector2(0.8, 0.8)
		health = 1
		speed = 900

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()


func take_damage():
	health -= 1
	%Bouboule.play_hurt()
	
	if health <= 0:
		AudioManager.mob_death_sound.play()
		GameOver.score += 1
		
		const SMOKE_SCENE = preload("res://scenes/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

		queue_free()
		


#VERTEX +=vec2(cos(TIME) * 100.0 , sin(TIME) * 100.0);    #Fait tourner une image par shader
