extends Node2D

var score = 0

func _ready():
	spawn_mob()
	spawn_mob()

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position= %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	%Score.text = str("Nombre de kills : " , score);
	get_tree().paused = true

