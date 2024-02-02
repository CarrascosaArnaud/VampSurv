extends Node2D

var liveTimer = 0
var maxTimer = true

func _physics_process(delta):
	liveTimer += delta
	if(liveTimer >= 60.0 && maxTimer):
		$SpawnTimer.wait_time = 0.2
		maxTimer = false
	elif(liveTimer >= 50.0 && maxTimer):
		$SpawnTimer.wait_time = 0.25
	elif(liveTimer >= 40.0 && maxTimer):
		$SpawnTimer.wait_time = 0.3
	elif(liveTimer >= 30.0 && maxTimer):
		$SpawnTimer.wait_time = 0.40
	elif(liveTimer >= 20.0 && maxTimer):
		$SpawnTimer.wait_time = 0.45
	elif(liveTimer >= 10.0 && maxTimer):
		$SpawnTimer.wait_time = 0.50
	
	%Score.text = str("Score : " , GameOver.score)

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position= %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.gameOver()
