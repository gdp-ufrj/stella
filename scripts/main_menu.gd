extends Control

@onready var startButton = $Start
@onready var creditsButton = $Credits
@onready var quitButton = $Quit

func _ready():
	if OS.get_name() == "Web":
		quitButton.hide()
		startButton.focus_neighbor_top = startButton.get_path_to(creditsButton)
		creditsButton.focus_neighbor_bottom = creditsButton.get_path_to(startButton)
		
	startButton.grab_focus()
	
func _input(event):
	if event is InputEventMouseMotion:
		var focusOwner = get_viewport().gui_get_focus_owner()
		if focusOwner: focusOwner.release_focus()
		
	if event is InputEventJoypadButton or event is InputEventKey:
		var focusOwner = get_viewport().gui_get_focus_owner()
		if focusOwner == null: startButton.grab_focus()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
