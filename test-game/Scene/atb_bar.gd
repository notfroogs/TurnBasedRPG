class_name ATBBar extends ProgressBar



signal filled()

const SPEED_BASE: float = 0.25
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#44d03a
func _ready() -> void:
	animation_player.play("RESET")
	value = randf_range(min_value,max_value*0.75)
func reset()->void:
	modulate = Color.WHITE
	value = min_value
	set_process(true)
func _process(_delta: float) -> void:
	value += SPEED_BASE
	if is_equal_approx(value,max_value):
		#get_theme_stylebox("fill").bg_color= Color("44d03a")
		#animation_player.play("highlight")
		modulate = Color("44d03a")
		set_process(false)
		filled.emit()
		#TODO BEGIN ANIMATION
