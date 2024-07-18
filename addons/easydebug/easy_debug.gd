extends CanvasLayer


@onready var _keys_container: VBoxContainer = %Keys
@onready var _values_container: VBoxContainer = %Values

var _value_label: PackedScene = preload("res://addons/easydebug/overlay/print_value.tscn")



func _ready() -> void:
	self.print("speed_movement", Vector3.LEFT)
	self.print("speed_projectile", Vector3.ZERO)
	self.print("is_player_grounded", true)


func _physics_process(delta: float) -> void:
	self.print("Time", Time.get_ticks_msec())
	


func print(key: String, value: Variant) -> void:
	for key_label: Label in _keys_container.get_children():
		if key == key_label.text.trim_suffix(":"):
			var index: int = key_label.get_index()
			var matched_value: ValueLabel = _values_container.get_child(index)
			matched_value.update_value(value)
			return
	
	var new_key_label = Label.new()
	_keys_container.add_child(new_key_label)
	new_key_label.text = key + ":"
	
	var new_value_label = _value_label.instantiate() as ValueLabel
	_values_container.add_child(new_value_label)
	new_value_label.update_value(value)


func remove(key: String) -> void:
	for key_label: Label in _keys_container.get_children():
		if key == key_label.text.trim_suffix(":"):
			var index: int = key_label.get_index()
			key_label.queue_free()
			_values_container.get_child(index).queue_free()


func clear() -> void:
	for child: Node in _keys_container.get_children():
		child.queue_free()
		
	for child: Node in _values_container.get_children():
		child.queue_free()


func _on_button_pressed() -> void:
	clear()
