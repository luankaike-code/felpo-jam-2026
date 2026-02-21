class_name Calc extends Resource

static func calc_order_obj_proximity(order1: OrderObj, order2: OrderObj) -> float:	
	var result := 0.0
	
	for i in order1.parchments.size():
		var parchment1 := order1.parchments[i]
		var parchment2 := order2.parchments[i]
		result += calc_parchment_obj_proximity(parchment1, parchment2)

	result /= order1.parchments.size()
	var size_difference := abs(order1.parchments.size() - order2.parchments.size()) as int
	if size_difference > 0:
		result /= 1.2*size_difference
	
	print(result)
	
	return result

static func calc_parchment_obj_proximity(parchment1: ParchmentObj, parchment2: ParchmentObj) -> float:
	var rune_result := 0.0
	var rune2_idx_used: Array[int]
	
	for rune1 in parchment1.content:
		for rune2_idx in parchment2.content.size():
			if rune2_idx in rune2_idx_used:
				continue
			var rune2 = parchment2.content[rune2_idx]
			if rune1.rune == rune2.rune:
				rune_result += 0.8
				rune_result += 0.2 if rune1.level == rune2.level else 0.0
				rune2_idx_used.push_front(rune2_idx)
				break
				
	rune_result /= parchment1.content.size()
	var size_difference := abs(parchment1.content.size() - parchment2.content.size()) as int
	if size_difference > 0:
		rune_result /= 1.2*size_difference
	
	return rune_result
