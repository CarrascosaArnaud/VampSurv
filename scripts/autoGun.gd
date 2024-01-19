extends Area2D

@onready var PRECISION = 10 + (get_node("../../../Game").score*2) #Plus proche de 0 = mieux

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front() # same as enemies_in_range[0]
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position + Vector2(randf_range(-PRECISION, PRECISION), randf_range(-PRECISION, PRECISION))
	new_bullet.global_rotation = %ShootingPoint.global_rotation + randf_range(-PRECISION/40, PRECISION/40)
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
	
	for i in range(min((get_node("../../../Game").score/5),5)):
		shoot()
