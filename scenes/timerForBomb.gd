extends Node2D

@onready var timer = $timer
@onready var label = $timeRemaining
@onready var keyToPress = $keyToPress
var qte_keys = ["A", "Z", "E", "R"]
var sequence = []
var current_index = 0
var current_key = ""
var countdown_time = 5  # Temps en secondes pour le compte à rebours
var total_mine_defuse = 0
var qte_is_active = false

func _ready():
	timer.wait_time = 1
	timer.stop()  
	label.text = str(countdown_time)

func _on_timer_timeout():
	countdown_time -= 1
	label.text = str(countdown_time)
	if countdown_time <= 0:
		timer.stop()
		print("game over")
		# Vous pouvez ajouter ici ce qui se passe quand le compte à rebours atteint zéro

func start_timer():
	countdown_time = 5
	label.text = str(countdown_time)
	timer.start()
	start_qte()
	label.text = str(countdown_time)
	
#Parti QTE

func start_qte():
	qte_is_active = true
	generate_sequence(5)
	current_index = 0
	keyToPress.text = "Appuyez sur: " + sequence[current_index]
	
func generate_sequence(length):
	sequence.clear()
	for i in range(length):
		sequence.append(qte_keys[randi() % qte_keys.size()])
		
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == get_scancode_from_key_string(sequence[current_index]):
			current_index += 1
			if current_index < sequence.size()-1:
				keyToPress.text = "Appuyez sur: " + sequence[current_index]
			else:
				qte_success()
		else:
			print('neuille')
			


func qte_success():
	qte_is_active = false
	print('Win !')
	timer.stop()
	total_mine_defuse+=1	
	self.hide()

#Helper 
func get_scancode_from_key_string(key_string: String) -> int:
	match key_string:
		"A": return KEY_A
		"Z": return KEY_Z
		"E": return KEY_E
		"R": return KEY_R
		_: return -1
