extends Control

@onready var confirmButton = $Confirm

func _ready():
	confirmButton.grab_focus()
	
func _input(event):
	if event is InputEventMouseMotion:
		var focusOwner = get_viewport().gui_get_focus_owner()
		if focusOwner: focusOwner.release_focus()
		
	if event is InputEventJoypadButton or event is InputEventKey:
		var focusOwner = get_viewport().gui_get_focus_owner()
		if focusOwner == null: confirmButton.grab_focus()

func _on_confirm_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
