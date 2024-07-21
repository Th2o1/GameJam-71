extends Node2D

@onready var timer = $timer
@onready var label = $timeRemaining
@onready var keyToPress = $keyToPress
var qte_keys = ["a", "z", "e", "r"]
var sequence = []
var current_index = 0
var current_key = ""
var countdown_time = 5  # Temps en secondes pour le compte à rebours

func _ready():
	timer.wait_time = 1
	timer.stop()  
	label.text = str(countdown_time)

func _on_timer_timeout():
	countdown_time -= 1
	label.text = str(countdown_time)
	if countdown_time <= 0:
		timer.stop()
		# Vous pouvez ajouter ici ce qui se passe quand le compte à rebours atteint zéro

func start_timer():
	timer.start()
	start_qte()
	
	label.text = str(countdown_time)
	
#Parti QTE

func start_qte():
	generate_sequence(5)
	current_index = 0
	keyToPress.text = "Appuyez sur: " + current_key
	show_next_key()
	
func show_next_key():
	if current_index < sequence.size():
		label.text = "Appuyez sur: " + sequence[current_index]
	else:
		qte_success()
	
func generate_sequence(length):
	sequence.clear()
	for i in range(length):
		sequence.append(qte_keys[randi() % qte_keys.size()])

func qte_success():
	pass
