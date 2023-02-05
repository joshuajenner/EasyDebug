@tool
extends Node2D

var collision_shape : CollisionShape2D
var collision_shape_resource : Shape2D
# var collision_shape_type = null

var warning : PackedStringArray = PackedStringArray()
const WARNING_STRING : String = "Please attach this node to a CollisionShape2D."


func _enter_tree() -> void:
	collision_shape = null
	collision_shape_resource = null
	
	check_parent()
	
	if collision_shape != null:
		self.emit_signal("draw")


func check_parent() -> void:
	var parent = get_parent()
	if parent is CollisionShape2D:
		hide_warning()
		get_parent_collision_shape(parent)
	else:
		show_warning()


func get_parent_collision_shape(parent: CollisionShape2D) -> void:
	collision_shape = parent
	collision_shape_resource = collision_shape.shape



func show_warning() -> void:
	warning = PackedStringArray([WARNING_STRING])

func hide_warning() -> void:
	warning = PackedStringArray()

func _get_configuration_warnings() -> PackedStringArray:
	return warning



func _draw() -> void:
	if collision_shape_resource is CircleShape2D:
		draw_circle_shape()
	else:
		pass

func draw_circle_shape():
	draw_circle(Vector2(0,0), collision_shape_resource.radius, "BLUE")

