@tool
extends Node2D

@export var collision_shape : CollisionShape2D = null : 
	set(value): _update_collision_shape(value)


var collision_shape_resource : Shape2D
# var collision_shape_type = null

var warning : PackedStringArray = PackedStringArray()
const WARNING_STRING : String = "Please attach this node to a CollisionShape2D."

const CENTRE : Vector2 = Vector2(0,0)

@export var update_drawing : bool
@export var draw_colour : Color

func _update_collision_shape(value):
	if value != null:
		collision_shape_resource = value.shape
		queue_redraw()

func _enter_tree() -> void:
#	collision_shape = null
#	collision_shape_resource = null
	
	check_parent()
	
#	if collision_shape != null:
#		self.emit_signal("draw")


func _process(delta):
	self.emit_signal("draw")


func check_parent() -> void:
	print(collision_shape)
#	var parent = get_parent()
#	if parent is CollisionShape2D:
#		hide_warning()
#		get_parent_collision_shape(parent)
#	else:
#		show_warning()


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
	print("uh")
	if collision_shape_resource is CircleShape2D:
		draw_circle_shape()
	else:
		pass

func draw_circle_shape():
	draw_arc(CENTRE, collision_shape_resource.radius, 0, 2*PI, 360, draw_colour, 1)
#	draw_circle(Vector2(0,0), collision_shape_resource.radius, "BLUE")
