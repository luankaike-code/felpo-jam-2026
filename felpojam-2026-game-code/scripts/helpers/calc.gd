class_name Calc extends Resource

static func calc_order_obj_proximity(order1: OrderObj, order2: OrderObj) -> float:	
	var p1 := order1.parchments
	var p2 := order2.parchments
	
	var max_ = [p1.size(), p2.size()].max()
	var count := 0
	var result := 0.0
	
	for p in p1:
		count += p.content.size()
			
	for p in p2:
		if p.content.size() > count:
			count += p.content.size() - p.content.size()
	
	for i in max_:
		if p1.size() <= i  || p2.size() <= i:
			continue
			
		var c1 := p1[i].content
		var c2 := p2[i].content
		var new_max = [c1.size(), c2.size()].max()
		
		for j in new_max:
			if c1.size() <= j  || c2.size() <= j:
				continue
			if c1[j].rune == c2[j].rune:
				result += 0.5
				result += 0.5 if c1[j].level == c2[j].level else 0.0
	
	#print(result, " - ", result /count, " - ", count)
	return result / count
