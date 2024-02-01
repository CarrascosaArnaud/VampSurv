extends CanvasLayer

@onready var score = 0
@onready var bestScore = 0

func randomText():
	var random = randi_range(1,6)
	if (random == 1):
		return ("Bien tenté...")
	elif (random == 2):
		return ("T'auras essayé")
	elif (random == 3):
		return ("Pas dingue")
	elif (random == 4):
		return ("Pas ouf")
	elif (random == 5):
		return ("Peux mieux faire")
	elif (random == 6):
		return ("GAME OVER")

func randomTextScore():
	var random = randi_range(1,5)
	if (random == 1):
		return ("Bien joué")
	elif (random == 2):
		return ("C'était pas mal !")
	elif (random == 3):
		return ("Bien joué à toi")
	elif (random == 4):
		return ("Mieux qu'avant")
	elif (random == 5):
		return ("Tu t'améliores")

func randomTextBetterScore():
	var random = randi_range(1,5)
	if (random == 1):
		return ("Joli score ça !")
	elif (random == 2):
		return ("Tu es LEGALEMENT skillé")
	elif (random == 3):
		return ("Pas mal du tout !")
	elif (random == 4):
		return ("De mieux en mieux")
	elif (random == 5):
		return ("Solide départ")

func gameOver():
	AudioManager.music.set_volume_db(-15) 
	self.visible = true
	
	if GameOver.bestScore < GameOver.score:
		GameOver.bestScore = GameOver.score
		if (GameOver.score >= 50) :
			%GameOverText.text = randomTextBetterScore()
		else:
			%GameOverText.text = randomTextScore()
	
	%GameOverText.text = randomText()
	%Score.text = str("Nombre de kills : " , GameOver.score);
	%BestScore.text = str("Meilleur score : " , GameOver.bestScore);
	#$ColorRect2/LiveTimer.text = str("Temps en vie : ", round(Game.liveTimer), " s");
	get_tree().paused = true
	GameOver.score = 0
