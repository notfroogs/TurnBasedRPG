class_name ATBBar extends ProgressBar



const SPEED_BASE: float = 0.25


func _ready() -> void:
	value = randf_range(min_value,max_value)

func _process(delta: float) -> void:
	value += SPEED_BASE
	
