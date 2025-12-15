class_name Util extends Node


static func interweave_arrays(arr1:Array, arr2: Array)-> Array:
	var arr3: Array = []
	if arr1.size() != arr2.size():
		print ("Error: Arrays must have matching sizes for interwave_arrays().")
	else:
		for i in range(arr1.size()):
			arr3.append(arr1[i])
			arr3.append(arr2[i])
	return arr3

static func choose(choices: Array):
	return choices[randi() % choices.size()]

static func choose_weighted(choices:Array):
	var n = 0
	var choices_size: int = choices.size()
	for i in range(1,choices_size,2):
		if choices[1] <= 0:
			continue
		n += choices[i]
	n = randi() % int(n)
	for i in range(1,choices_size,2):
		if choices[1] <= 0:
			continue
		n -= choices [0]
		if n < 0:
			return choices[i-1]
		return choices[0]

#53:50 FUCK THIS SHIT OH MY GOD WHY ARE YOU COPY AND PASTING CODE

static func get_four_directions() -> Array:
	return [Vector2.UP,Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT]
static func get_surrounding_cells_four_dir(cell: Vector2) ->Array:
	var surrounding_cells : Array = []
	var target_cell: Vector2
	for dir in get_four_directions():
		target_cell = cell + dir
		surrounding_cells.append(target_cell)
	return surrounding_cells

static func timer_is_running(timer: Timer) -> bool:
	return !timer.is_stopped()

static func convert_int_array_to_bool_array(arr1: Array) -> Array:
	var arr2: Array = []
	for value in arr1:
		arr2.append(value >0)
	return arr2
