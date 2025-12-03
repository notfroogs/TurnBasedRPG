extends Control


@onready var _options: WindowDefault = $options
@onready var _options_menu: Menu = $options/optionss

func _ready() -> void:
	_options_menu.button_focus(0)



func _on_optionss_button_focused(button: BaseButton) -> void:
	pass # Replace with function body. 
func _on_optionss_button_pressed(button: BaseButton) -> void:
	print(button.text)
