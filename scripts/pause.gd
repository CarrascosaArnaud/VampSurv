extends CanvasLayer

func _input(event):
	
	if event.is_action_pressed("shoot") && get_tree().paused:
		get_tree().paused = !get_tree().paused
		get_tree().reload_current_scene()
		
		AudioManager.music.set_volume_db(0)
