extends TileMap

#grid variables
const rows : int=14
const cols : int=15
const cell_size : int=50


#tilemap variables
var tile_id : int=2


#layer variables
var mine_layer : int=0
var numbers_layer : int=1
var grass_layer : int=2
var flags_layer : int=3
var hover_layer : int=4


#atlas coordinates
var mine_atlas := Vector2i(4, 0)
var number_atlas : Array = generate_number_atlas()

#liste pour stocker les coords des mines
var mine_coords := []

func generate_number_atlas():
	var a := []
	for i in range(8):
		a.append(Vector2i(i, 1))
	return a 

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	

func new_game():
	clear()
	mine_coords.clear()
	generate_mines()
	generate_numbers()

func generate_mines():
	for i in range(get_parent().total_mines):
		var mine_pos = Vector2i(randi_range(0, cols - 1), randi_range(0, rows - 1))
		while mine_coords.has(mine_pos):
			mine_pos = Vector2i(randi_range(0, cols - 1), randi_range(0, rows - 1))
		mine_coords.append(mine_pos)
		#add mine to tilemap
		set_cell(mine_layer, mine_pos, tile_id, mine_atlas)

func generate_numbers():
	for i in get_empty_cells():
		var mine_count : int = 0
		for j in get_all_surround_cells(i):
			#check if there is a mine in the cell
			if is_mine(j):
				mine_count += 1
		#once counted, add the number cell to the tilemap
		if mine_count > 0:
			set_cell(numbers_layer, i, tile_id, number_atlas[mine_count - 1])
		
	
	#get empty cells
	#iterate through empty cells and get all surround cells
	#add up numbers of mines inside surrounding cells
	
func get_empty_cells():
	var empty_cells := []
	#iterate over grid
	for y in range(rows):
		for x in range(cols):
			#check if the cell is empty and add it to the array
			if not is_mine(Vector2i(x, y)):
				empty_cells.append(Vector2i(x, y))
	return empty_cells
	
	
func get_all_surround_cells(middle_cell):
	var surrounding_cells := []
	var target_cell
	for y in range (3):
		for x in range (3):
			target_cell = middle_cell + Vector2i(x - 1, y - 1)
			#skip cell if it is the one in the middle
			if target_cell != middle_cell:
				#check that the cell is on the grid
				if (target_cell.x >= 0 and target_cell.x <= cols - 1 and target_cell.y >= 0 and target_cell.y <= rows - 1):
					surrounding_cells.append(target_cell)
	return surrounding_cells
			
	
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



#helper functions
func is_mine(pos):
	get_cell_source_id(mine_layer, pos) != -1
