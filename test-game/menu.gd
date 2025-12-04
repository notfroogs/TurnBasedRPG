class_name Menu extends Control



signal button_focused(button: BaseButton)
signal button_pressed(button: BaseButton)
var index: int = 0

func _ready() -> void:
	for button in get_buttons():
		button.focus_exited.connect(_on_Button_focus_exited.bind(button))
		button.focus_entered.connect(_on_Button_focused.bind(button))
		button.pressed.connect(_on_Button_pressed.bind(button))
		
func get_buttons() -> Array:
	return get_children()

func connect_to_buttons(target: Object, _name: String= name) -> void:
	var callable: Callable = Callable()
	callable = Callable(target,"_on_" + _name + "_focused")
	button_focused.connect(callable)
	callable = Callable(target, "_on_" + _name + "_pressed")
	button_pressed.connect(callable)

func button_focus(n:int=index)->void:
	var button : BaseButton = get_buttons()[n]
	button.grab_focus()

func _on_Button_focus_exited(button:BaseButton)->void:
	await get_tree().process_frame
	if not get_viewport().gui_get_focus_owner() in get_buttons():
		print("bring focus back")
		button.grab_focus()
# Uhh i lowkey dont know why the focus is glitching out ill figure it out later its something with this function tho.
# im pretty sure its something with the control nodes that were connected with this script
func _on_Button_focused(button:BaseButton)->void:
		emit_signal("button_focused",button)		
		
func _on_Button_pressed(button: BaseButton)->void:
	emit_signal("button_pressed",button)
