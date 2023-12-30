function scr_actual_equal(val1, val2, tolerance){
	if(abs(val1 - val2) < tolerance)
		return true;
	return false;
}