@tool
extends Node2D

@export var collision_shape : CollisionShape2D = null : 
	set(value): _update_collision_shape(value)


var collision_shape_resource : Shape2D


func _update_collision_shape(value):
	print(value)
	if value != null:
		collision_shape_resource = value.shape
		self.emit_signal("draw")
	print(collision_shape)


func _enter_tree() -> void:
	pass


func _draw() -> void:
	print("uh")
	if collision_shape_resource is CircleShape2D:
		draw_circle_shape()
	else:
		pass

func draw_circle_shape():
	draw_arc(Vector2(0,0), collision_shape_resource.radius, 0, 2*PI, 360, "BLUE", 1)
#	draw_circle(Vector2(0,0), collision_shape_resource.radius, "BLUE")

