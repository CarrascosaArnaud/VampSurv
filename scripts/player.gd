extends CharacterBody2D

signal health_depleted

var health = 0.0
const SPEED = 1500
const ACCELERATION = 150
const FRICTION = 400
const DAMAGE_RATE = 5.0

func accelerate(direction: Vector2):
	velocity = velocity.move_toward(SPEED * direction, ACCELERATION)

func slowDown():
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	if direction != Vector2.ZERO:
		accelerate(direction) #velocity = direction * SPEED
		move_and_slide()
		if(velocity > Vector2(0.5,-0.5) || velocity > Vector2(-0.5,0.5)):
			$Goofyboi.play_run_animation() 
		else:
			$Goofyboi.play_acceleration_animation()
	else:
		slowDown()
		$Goofyboi.play_idle_animation()
	
	#if (velocity.length() > 0.0):
		#$Goofyboi.play_run_animation() # %HappyBoo == get_node("HappyBoo") peu importe le chemin
	#elif(direction.x < SPEED):
		#$Goofyboi.play_acceleration_animation()
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%HealthBar.value = health
		#%ProgressBar.max_value = health #pv max
		if health <= 0.0:
			health_depleted.emit()
			AudioManager.player_death_sound.play()
