extends Control

#Top Clock
#hour component
onready var hour_plus_top = get_node("Hour/Plus")
onready var hour_sub_top = get_node("Hour/Sub")

#minute component
onready var minute_plus_top = get_node("Minutes/Plus")
onready var minute_sub_top = get_node("Minutes/Sub")
onready var minute_text_top = get_node("Minutes/Label")

#Bottom Clock
#hour component
onready var hour_plus_bottom = get_node("Hour/Plus")
onready var hour_sub_bottom = get_node("Hour/Sub")

#minute component
onready var minute_plus_bottom = get_node("Minutes/Plus")
onready var minute_sub_bottom = get_node("Minutes/Sub")
onready var minute_text_bottom = get_node("Minutes/Label")
