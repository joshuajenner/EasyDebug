@tool
extends EditorPlugin


const EASY_DEBUG_NAME = "EZDebug"
const EASY_DEBUG_PATH = "res://addons/easydebug/ezd_autoload.gd"


func _enter_tree():
	add_autoload_singleton(EASY_DEBUG_NAME, EASY_DEBUG_PATH)
	
	# Add 2D Debug Custom Nodes
	add_custom_type("EZDCollisionShape2D", "Node2D", preload("res://addons/easydebug/2d/ezd_debug_collision_shape.gd"), preload("res://addons/easydebug/2d/MeshInstance2D.svg"))


func _exit_tree():
	remove_autoload_singleton(EASY_DEBUG_NAME)
	
	# Remove 2D Debug Custom Nodes
	remove_custom_type("DebugCollisionShape2D")
