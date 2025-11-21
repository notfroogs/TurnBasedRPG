class_name Menu extends VBoxContainer



signal button_focused(button)
signal button_pressed(button)
var index: int = 0

func get_buttons() -> Array:
	return get_children()

func connect_to_buttons() -> void:
	for button in get_buttons():
		button.focus_entered.connect(_on_Button_focused.bind(button))
		button.pressed.connect(_on_Button_pressed.bind(button))
		
func button_focus(n:int=index)->void:
	get_buttons()
func _on_Button_focused(button:BaseButton)->void:
		emit_signal("button_focused",button)		
		
func _on_Button_pressed(button: BaseButton)->void:
	emit_signal("button_pressed",button)
