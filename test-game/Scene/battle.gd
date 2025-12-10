extends Control

enum States{
	 OPTIONS,
	TARGETS,
}
 

@onready var _options: WindowDefault = $options
@onready var _options_menu: Menu = $options/optionss
@onready var _enemies_menu: Menu = $enemies

var state: States = States.OPTIONS

func _ready() -> void:
	_options_menu.button_focus(0)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match state:
			States.OPTIONS:
				pass
			States.TARGETS:
				state = States.OPTIONS
				_options_menu.button_focus()


func _on_optionss_button_focused(button: BaseButton) -> void:
	pass
func _on_optionss_button_pressed(button: BaseButton)  -> void:
	print(button.text)
	match button.text:
		"ATTACK":
			state = States.TARGETS
			_enemies_menu.button_focus()
