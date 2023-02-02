extends Node


var counter : int = 0
var counter_reset : int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0


func print_with_counter(values: Array):
	var print_string = str(counter) + ":"
	for val in values:
		var val_to_string = str(val)
		print_string = print_string + " " + val_to_string
	print(print_string)

func pwc(values: Array):
	print_with_counter(values)


func increment_counter(step : int = 1):
	counter += step

func ic(step : int = 1):
	increment_counter(step)

func decrement_counter(step : int = 1):
	counter -= step

func dc(step : int = 1):
	increment_counter(step)


func reset_counter(reset_value : int = counter_reset):
	counter = reset_value

func rc(reset_value):
	reset_counter(reset_value)
