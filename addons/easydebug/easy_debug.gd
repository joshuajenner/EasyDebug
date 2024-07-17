extends CanvasLayer

@onready var print_container: VBoxContainer = $Margin/PanelContainer/MarginContainer/VBoxContainer

var print_value = preload("res://addons/easydebug/overlay/print_value.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.print("Test", Vector2.ZERO)
	self.print("Test2", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func print(key: String, value: Variant) -> void:
	# TODO - Should check if key already exists
	var new_print = print_value.instantiate() as PrintValue
	print_container.add_child(new_print)
	new_print.init_display(key, value)
