class_name PlayerController
extends CharacterBody3D

#movement variables
#crea menu a discesa nell'inspector per collezionare le variabili esposte
@export_group("Movement")
@export var max_speed : float = 4.0 #4m al secondo
@export var walk_accelleration : float = 20.0
@export var breaking : float = 20.0
@export var air_accelleration : float = 4.0
@export var jump_force : float = 5.0
@export var gravity_modifier : float = 1.5
@export var max_run_speed : float = 6.0
var is_running : bool = false

#camera variables
@export_group("Camera")
@export var look_sensivity : float = 0.005
var camera_look_input : Vector2

#recupera ref. della camera
@onready var camera : Camera3D = get_node("Camera3D")

#recupera l'impostazione della gravità settata in Prokect Settings
@onready var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity") + gravity_modifier


func _ready():
	#
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float):
	# lettura input movimento
	var move_input = Input.get_vector("move_left","move_right", "move_forward","move_back")
	velocity = Vector3(move_input.x,0,move_input.y) * max_speed
	move_and_slide()
	
	#lettura movimento camera
	#per il movimento laterale dobbiamo ruotare tutto il character
	rotate_y(-camera_look_input.x * look_sensivity)
	
	#per il movimento verticale, la rotazione è solo della camera
	camera.rotate_x(-camera_look_input.y * look_sensivity)
	camera.rotation.x = clamp(camera.rotation.x,-1.5,1.5) #imposta limite (in radianti) della rotazione
	
	camera_look_input = Vector2.ZERO
	
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		camera_look_input = event.relative
