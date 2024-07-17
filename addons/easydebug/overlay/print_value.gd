class_name PrintValue
extends MarginContainer


@onready var key: Label = $HBoxContainer/Key
@onready var value: RichTextLabel = $HBoxContainer/Value


func init_display(new_key: String, new_value: Variant) -> void:
	key.text = new_key
	value.text = get_string_from_value(new_value)


func update_value(new_value: Variant) -> void:
	value.text = get_string_from_value(new_value)


func get_string_from_value(new_value: Variant) -> String:
	if typeof(new_value) == TYPE_BOOL:
		return get_coloured_string_from_bool(new_value)
	else:
		return "[right][color=\"Deepskyblue\"]" + str(new_value) + "[/color][/right]"


func get_coloured_string_from_bool(value: bool) -> String:
	if value:
		return "[right][color=\"green\"]true[/color][/right]"
	else:
		return "[right][color=\"red\"]false[/color][/right]"
