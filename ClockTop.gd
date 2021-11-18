extends Control

var hour = 0
var minute = 0

#animation
onready var animtree = get_node("AnimationTree").get("parameters/playback")

#hour component
onready var hour_plus = get_node("Clock1/Hour/Plus_hour")
onready var hour_sub = get_node("Clock1/Hour/Sub_hour")
onready var hour_text = get_node("Clock1/Hour/Label")
onready var hour_tongue = get_node("Clock1/ClockBg/ClockHour")

#minute component
onready var minute_plus = get_node("Clock1/Minutes/Plus_minute")
onready var minute_sub = get_node("Clock1/Minutes/Sub_minute")
onready var minute_text = get_node("Clock1/Minutes/Label")
onready var minute_tongue = get_node("Clock1/ClockBg/ClockMinute")

#timer
export var start_timer = false
var timer_finsh = false
var timer_hours = 0
var timer_minutes = 0
var timer_seconds = 0
var temp_second = 0
onready var timer_text = get_node("Timer/Label")

#alarm finish
onready var alarm_finish = preload("res://Alarm_Finish.tscn")

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

	#timer
	if start_timer == true:
		#update timer text
		var time_array = ['','','']
		if timer_hours < 10:
			time_array[0] = "0" + String(timer_hours)
		else:
			time_array[0] = String(timer_hours)
		if timer_minutes < 10:
			time_array[1] = "0" + String(timer_minutes)
		else:
			time_array[1] = String(timer_minutes)
		if timer_seconds < 10:
			time_array[2] = "0" + String(timer_seconds)
		else:
			time_array[2] = String(round(timer_seconds))
		timer_text.text = time_array[0] + ":" + time_array[1] + ":" + time_array[2]
		
		#update timer
		if timer_seconds <= 0:
			if timer_minutes == 0:
				if timer_hours > 0:
					timer_hours -= 1
					timer_minutes = 60
					timer_seconds = 60
				else:
					timer_minutes = 0
					timer_seconds = 0
			else:
				timer_minutes -= 1
				timer_seconds = 60
		else:
			temp_second -= 1 * delta
			if temp_second <= 0:
				timer_seconds -= 1
				temp_second = 1
		#end timer
		if timer_seconds == 0 and timer_minutes == 0 and timer_hours == 0:
			#alarm ring scene
			var alarm_instance = alarm_finish.instance()
			get_tree().get_root().get_node("Control").add_child(alarm_instance)
			#alarm to idle
			animtree.travel("Cancel Complete Alarm")
			start_timer = false

#hour
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

#minute
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

#set alarm
func _on_SetAlarm_button_down():
	animtree.travel("Alarm Set")
	timer_hours = hour
	timer_minutes = minute
	timer_seconds = 60
	temp_second = 1
	start_timer = true

#stop alarm
func _on_StopAlarm_button_down():
	start_timer = false
	animtree.travel("Cancel Complete Alarm")
