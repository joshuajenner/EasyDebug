@tool
extends Node2D

var collision_shape : CollisionShape2D = null
var collision_shape_resource : Shape2D = null
var collision_shape_type = null

var warning : PackedStringArray = PackedStringArray()
const WARNING_STRING : String = "Please attach this node to a CollisionShape2D."


func _enter_tree():
	check_parent()


func check_parent():
	var parent = get_parent()
	if parent is CollisionShape2D:
		hide_warning()
		get_parent_collision_shape(parent)
	else:
		show_warning()


func get_parent_collision_shape(parent: CollisionShape2D):
	collision_shape = parent
	collision_shape_resource = collision_shape.shape


func show_warning():
	warning = PackedStringArray([WARNING_STRING])

func hide_warning() -> void:
	warning = PackedStringArray()


func _get_configuration_warnings() -> PackedStringArray:
	return warning
