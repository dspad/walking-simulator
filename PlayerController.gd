class_name PlayerController
extends CharacterBody3D

#movement variables
#crea menu a discesa nell'inspector per collezionare le variabili esposte
@export_group("Movement")
@export var max_speed : float = 4.0
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
	pass

func _physics_process(delta: float):
	pass
	
func _unhandled_input(event: InputEvent):
	pass
