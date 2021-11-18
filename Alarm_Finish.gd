extends Control

#stop button
func _on_Stop_button_down():
	self.queue_free()
