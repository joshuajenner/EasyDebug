extends Node2D

@export var collision_shape: CollisionShape2D
@export var follow_transform: bool
#var collision_shape_resource : Shape2D


func _update_collision_shape(value):
	pass
	#print(value)
	#if value != null:
		#collision_shape_resource = value.shape
		#self.emit_signal("draw")
	#print(collision_shape)


func _enter_tree() -> void:
	pass


func _ready() -> void:
	visible = true


func _physics_process(delta: float) -> void:
	if visible and follow_transform:
		queue_redraw()


func _draw() -> void:
	var draw_position: Vector2 = Vector2.ZERO
	if follow_transform:
		draw_position = collision_shape.global_position
	
	if collision_shape.shape is CircleShape2D:
		draw_circle_shape(draw_position)
	else:
		pass


func draw_circle_shape(position: Vector2 = Vector2.ZERO) -> void:
	draw_arc(position, collision_shape.shape.radius, 0, 2*PI, 360, "BLUE", 1)
#	draw_circle(Vector2(0,0), collision_shape_resource.radius, "BLUE")
