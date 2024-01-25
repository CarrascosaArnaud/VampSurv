extends Area2D

func _physics_process(delta):
	look_at(get_global_mouse_position())

func shoot():
	const MUZZLE_FLASH = preload("res://scenes/muzzle_flash.tscn")
	var new_muzzle = MUZZLE_FLASH.instantiate()
	%ShootingPoint.add_child(new_muzzle)
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	AudioManager.manual_gun_shoot_sound.play()
	
func _on_timer_timeout():
	if Input.is_action_pressed("shoot"):
		shoot()
