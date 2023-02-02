@tool
extends EditorPlugin


const EASY_DEBUG_NAME = "EZDebug"
const EASY_DEBUG_PATH = "res://addons/easydebug/ezd_autoload.gd"


func _enter_tree():
	add_autoload_singleton(EASY_DEBUG_NAME, EASY_DEBUG_PATH)


func _exit_tree():
	remove_autoload_singleton(EASY_DEBUG_NAME)
