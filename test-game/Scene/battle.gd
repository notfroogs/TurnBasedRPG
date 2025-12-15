extends Control

enum States{
	 OPTIONS,
	TARGETS,
}
 

@onready var _options: WindowDefault = $options
@onready var _options_menu: Menu = $options/optionss
@onready var _enemies_menu: Menu = $enemies
@onready var _players_menu: Menu= $Players
@onready var _players_info:Array=$GUIMargin/bottom/Players/MarginContainer/VBoxContainer.get_children()
@onready var _cursor: MenuCursor = $MenuCursor
var state: States = States.OPTIONS
var atb_queue: Array=[]
var event_queue: Array=[]

func _ready() -> void:
	_options.hide()
	for player in _players_info:
		player.atb_ready.connect(_on_players_atb_ready.bind(player))
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match state:
			States.OPTIONS:
				pass
			States.TARGETS:
				state = States.OPTIONS
				_options_menu.button_focus()
func advance_atb_queue()->void:
	if atb_queue.is_empty():
		return
	var current_player:BattlePlayerBar= atb_queue.pop_front()
	current_player.reset()
	
	var next_player:BattlePlayerBar= atb_queue.front()
	if next_player:
		next_player.highlight()
		_options_menu.button_focus(0)
	else:
		get_viewport().gui_release_focus()
		_options.hide()
		_cursor.hide()
	

func _on_optionss_button_focused(button: BaseButton) -> void:
	pass
func _on_optionss_button_pressed(button: BaseButton)  -> void:
	print(button.text)
	match button.text:
		"ATTACK":
			state = States.TARGETS
			_enemies_menu.button_focus()
#Press attack to move cursor to the enemies, press esc to go back to the options
func _on_players_atb_ready(player:BattlePlayerBar):
	
	if atb_queue.is_empty():
		player.highlight()
		_options.show()
		_options_menu.button_focus(0)
	atb_queue.append(player)


func _on_players_button_pressed(button: BaseButton) -> void:
	advance_atb_queue()

func _on_enemies_button_pressed(button: BaseButton) -> void:
	#TODO STORE EVENTS HERE
	state = States.OPTIONS
	advance_atb_queue()
