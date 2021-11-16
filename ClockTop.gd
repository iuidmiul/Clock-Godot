extends Control

var hour = 0
var minute = 0

#hour component
onready var hour_plus = get_node("Hour/Plus")
onready var hour_sub = get_node("Hour/Sub")
onready var hour_text = get_node("Hour/Label")
onready var hour_tongue = get_node("ClockBg/ClockHour")

#minute component
onready var minute_plus = get_node("Minutes/Plus")
onready var minute_sub = get_node("Minutes/Sub")
onready var minute_text = get_node("Minutes/Label")
onready var minute_tongue = get_node("ClockBg/ClockMinute")

func _process(delta):
	#update hour text
	if hour < 10:
		hour_text.text = "0" + String(hour)
	else:
		hour_text.text = String(hour)
	#update minute text
	if minute < 10:
		minute_text.text = "0" + String(minute)
	else:
		minute_text.text = String(minute)

	#update clock hour tongue
	if hour == 0:
		hour_tongue.rotation_degrees = 0
	else:
		hour_tongue.rotation_degrees = 30 * hour
	#update clock minute tongue
	if minute == 0:
		minute_tongue.rotation_degrees = 0
	else:
		minute_tongue.rotation_degrees = 6 * minute

func _on_Plus_hour_button_down():
	if hour < 24:
		hour += 1
	else:
		hour = 0

func _on_Sub_hour_button_down():
	if hour > 0:
		hour -= 1
	else:
		hour = 24


func _on_Plus_minute_button_down():
	if minute < 60:
		minute += 1
	else:
		minute = 0


func _on_Sub_minute_button_down():
	if minute > 0:
		minute -= 1
	else:
		minute = 60
