class_name BattlePlayerBar extends HBoxContainer



signal atb_ready()
@onready var _animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	_animation_player.play("RESET")

func highlight(on:bool)->void:
	var anim: String ="highlight" if on else "RESET"
	_animation_player.play(anim)


func _on_at_bbar_filled() -> void:
	atb_ready.emit()
	
#44d03a
