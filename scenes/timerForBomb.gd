extends Node2D   

@onready var timer = $timer
@onready var label = $Label

var countdown_time = 60  # Temps en secondes pour le compte à rebours

func _ready():
	timer.wait_time = 1
	

	timer.start()
	label.text = str(countdown_time)

func _on_timer_timeout():
	countdown_time -= 1
	label.text = str(countdown_time)
	if countdown_time <= 0:
		timer.stop()
		# Vous pouvez ajouter ici ce qui se passe quand le compte à rebours atteint zéro
