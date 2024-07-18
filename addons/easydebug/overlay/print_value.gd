class_name ValueLabel
extends RichTextLabel


func update_value(new_value: Variant) -> void:
	text = _get_string_from_value(new_value)


func _get_string_from_value(new_value: Variant) -> String:
	if typeof(new_value) == TYPE_BOOL:
		return _get_coloured_string_from_bool(new_value)
	else:
		return "[right][color=\"Deepskyblue\"]" + str(new_value) + "[/color][/right]"


func _get_coloured_string_from_bool(value: bool) -> String:
	if value:
		return "[right][color=\"green\"]true[/color][/right]"
	else:
		return "[right][color=\"red\"]false[/color][/right]"
