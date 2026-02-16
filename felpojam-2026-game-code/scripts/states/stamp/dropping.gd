extends State

var host: Stamp

func to_stand():
	host.global_position = host.current_stand.global_position

func enter(host_: Stamp) -> void:
	host = host_
	to_stand()
