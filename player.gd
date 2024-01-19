extends CharacterBody2D

signal health_depleted

var health = 0.0
const SPEED = 1500

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if (velocity.length() > 0.0):
		$HappyBoo.play_walk_animation() # %HappyBoo == get_node("HappyBoo") peu importe le chemin
	else:
		$HappyBoo.play_idle_animation()
		

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		#%ProgressBar.max_value = health #pv max
		if health <= 0.0:
			health_depleted.emit()
