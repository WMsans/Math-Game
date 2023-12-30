///@arg object1
///@arg object2
///@arg distance
function scr_actual_dist(_obj1,_obj2,_dist){
	var _x = _obj1.x - _obj2.x;
	var _y = _obj1.y - _obj2.y;
	var sign_x = sign(_x);
	if(abs(_x) <= 1){
		with(_obj2){
			for(var i =0; i< sqr(_dist);i++){
				if(place_meeting(x, y + i*sign(_y), _obj1)){
					return _dist > sqrt(1 + sqr(i));
				}
			}
		}
		return false;
	}
	var sign_y = _y / _x;
	with(_obj2){
		for(var i = 0; i<sqr(_dist); i++){
			if(place_meeting(x + i*sign_x, y + i*sign_y, _obj1)){
				return _dist > sqrt(sqr(i * sign_x) + sqr(i * sign_y));
			}
		}
	}
	return false;
}