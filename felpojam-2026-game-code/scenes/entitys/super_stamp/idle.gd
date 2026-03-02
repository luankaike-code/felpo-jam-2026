extends State

var host: NewSuperStamp

func handle_stand():
	if host.current_paper || !host.current_stand:
		if host.current_paper:
			host.current_paper.is_draggable = false
		return
	
	var res := host.current_stand.place_item(host)
	if !res:
		host.default_stand.place_item(host)

func enter(host_) -> void:
	host = host_
	host.is_draggable = true
	handle_stand()

func exit() -> void:
	host.is_draggable = false
	handle_stand()
