class_name Calc extends Resource

static func calc_order_obj_proximity(order1: OrderObj, order2: OrderObj) -> float:	
	var result := 0.0
	
	for parchment2 in order2.parchments:
		var best_result := get_best_parchment_obj_proximity(order1, parchment2)
		order1.parchments.pop_at(order1.parchments.find(best_result.parchment1))
		result += best_result.result

	result /= order1.parchments.size()
	var size_difference := abs(order1.parchments.size() - order2.parchments.size()) as int
	if size_difference > 0:
		result /= 1.2*size_difference
	
	return result

static func get_best_parchment_obj_proximity(order1: OrderObj, parchment2: ParchmentObj) -> BestParchmentObjProximityObj:
	var results: Array[BestParchmentObjProximityObj]
	
	for o in order1.parchments:
		var result = calc_parchment_obj_proximity(o, parchment2)
		results.push_back(BestParchmentObjProximityObj.new(o, result))
	
	var bester: BestParchmentObjProximityObj = null
	for obj in results:
		if !bester ||  obj.result > bester.result:
			bester = obj
	
	return bester

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
