extends RayCast3D

@onready var interact_prompt_label : Label = get_node("InteractionPrompt")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var object = get_collider()
	interact_prompt_label.text = ""
	
	if object and object is InteractableObject:
		pass
