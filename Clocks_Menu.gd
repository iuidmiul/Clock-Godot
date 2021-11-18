extends Control

onready var animtree = get_node("AnimationTree").get("parameters/playback")

#alarm 1
func _on_Alarm1_button_down():
	animtree.travel("Alarm2_To_Alarm1")

#alarm 2
func _on_Alarm2_button_down():
	animtree.travel("Alarm1_To_Alarm2")

#exit
func _on_Exit_button_down():
	get_tree().quit()
