class_name ATBBar extends ProgressBar



const SPEED_BASE: float = 0.25


func _ready() -> void:
	value = randf_range(min_value,max_value)

func _process(delta: float) -> void:
	value += SPEED_BASE


func _on_value_changed(value: float) -> void:
	pass # Replace with function body.
