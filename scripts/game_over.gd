extends CanvasLayer

@onready var score = 0
@onready var bestScore = 0

func gameOver():
	AudioManager.music.set_volume_db(-15) 
	self.visible = true
	
	if GameOver.bestScore < GameOver.score:
		GameOver.bestScore = GameOver.score
		%GameOverText.text = str("Bien joué !")
	
	%Score.text = str("Nombre de kills : " , GameOver.score);
	%BestScore.text = str("Meilleur score : " , GameOver.bestScore);
	get_tree().paused = true
	GameOver.score = 0
