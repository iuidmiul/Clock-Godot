extends Button

#button background
onready var background = get_node("Bg")

#animation
onready var anim = get_node("AnimationTree").get("parameters/playback")

#global anim


func _physics_process(delta):
	pass

#mouse press
func _on_Button_pressed():
	anim.travel("Start")

#mouse enter
func _on_Button_mouse_entered():
	background.color = Color8(65,65,65,255)

#mouse exit
func _on_Button_mouse_exited():
	background.color = Color8(71,71,71,255)
